#ifndef renderer_c
#define renderer_c

#include "types.h"
#include "memory.c"
#include "math.c"
#include "logger.c"

static const uint32_t renderer_bytes_per_triangle_vertex = 15;
static const uint32_t renderer_bytes_per_triangle = renderer_bytes_per_triangle_vertex * 3;

static float 	*renderer_triangles;
static uint64_t  renderer_triangles_bytes_max;
static uint64_t  renderer_triangles_bytes_cur;

static uint32_t renderer_init(uint64_t triangles_count) {
	
	uint64_t bytes_required = triangles_count * renderer_bytes_per_triangle;
	
	if (memory_alloc(bytes_required, &renderer_triangles) != 0) {
		logger_log("renderer_init: memory_alloc failed\n");
		return 2;
	}
	
	renderer_triangles_bytes_max = bytes_required;
	renderer_triangles_bytes_cur = 0;
	
	return 0;

}

static uint32_t triangle_add(
	float x1, float y1, float z1, float u1, float v1,
	float x2, float y2, float z2, float u2, float v2,
	float x3, float y3, float z3, float u3, float v3,
	uint64_t *output
) {

	if (renderer_triangles_bytes_cur >= renderer_triangles_bytes_max) {
		logger_log("triangle_add: not enough memory (%llu / %llu)\n", renderer_triangles_bytes_cur, renderer_triangles_bytes_max);
		return 1;
	}

	else if (output == 0) {
		logger_log("triangle_add: invalid argument\n");
		return 2;
	}

	uint32_t itr = 0;

	while (itr < renderer_triangles_bytes_max) {
	
		if (renderer_triangles[itr] == renderer_triangles[itr + renderer_bytes_per_triangle_vertex] &&
		    renderer_triangles[itr + renderer_bytes_per_triangle_vertex] == renderer_triangles[itr + renderer_bytes_per_triangle_vertex * 2]) {
			
			renderer_triangles[itr + 0] = x1;
			renderer_triangles[itr + 1] = y1;
			renderer_triangles[itr + 2] = z1;
			renderer_triangles[itr + 3] = u1;
			renderer_triangles[itr + 4] = v1;
			
			renderer_triangles[itr + renderer_bytes_per_triangle_vertex + 0] = x2;
			renderer_triangles[itr + renderer_bytes_per_triangle_vertex + 1] = y2;
			renderer_triangles[itr + renderer_bytes_per_triangle_vertex + 2] = z2;
			renderer_triangles[itr + renderer_bytes_per_triangle_vertex + 3] = u2;
			renderer_triangles[itr + renderer_bytes_per_triangle_vertex + 4] = v2;
			
			renderer_triangles[itr + renderer_bytes_per_triangle_vertex * 2 + 0] = x3;
			renderer_triangles[itr + renderer_bytes_per_triangle_vertex * 2 + 1] = y3;
			renderer_triangles[itr + renderer_bytes_per_triangle_vertex * 2 + 2] = z3;
			renderer_triangles[itr + renderer_bytes_per_triangle_vertex * 2 + 3] = u3;
			renderer_triangles[itr + renderer_bytes_per_triangle_vertex * 2 + 4] = v3;
			
			* output = itr;
			
			renderer_triangles_bytes_cur += renderer_bytes_per_triangle;
			
			return 0;
			
		}
	
		itr += renderer_bytes_per_triangle;
	
	}
	
	return 3;

}

static uint32_t triangle_rem(uint64_t index) {

	if (renderer_bytes_per_triangle == 0) {
		logger_log("triangle_rem: none to remove\n");
		return 1;
	}

	renderer_triangles[index] = 0;
	renderer_triangles[index + renderer_bytes_per_triangle_vertex] = 0;
	renderer_triangles[index + renderer_bytes_per_triangle_vertex * 2] = 0;
	
	renderer_triangles_bytes_cur -= renderer_bytes_per_triangle;
	
	return 0;

}

static uint32_t triangle_draw(

	float x1, float y1, float u1, float v1,
	float x2, float y2, float u2, float v2,
	float x3, float y3, float u3, float v3,
	
	uint32_t src_width, uint32_t src_height, uint32_t *src_pixels,
	uint32_t dst_width, uint32_t dst_height, uint32_t *dst_pixels
	
) {

	if (src_pixels == 0 || dst_pixels == 0) {
		logger_log("triangle_draw: invalid argument\n");
		return 1;
	}

	float   topx = x1, topy = y1, topu = u1, topv = v1,
		midx = x2, midy = y2, midu = u2, midv = v2,
		botx = x3, boty = y3, botu = u3, botv = v3;

	if (topy < midy) {
	
		float 	tempx = topx, 
			tempy = topy, 
			tempu = topu, 
			tempv = topv;
		
		topx = midx;
		topy = midy;
		topu = midu;
		topv = midv;
		
		midx = tempx;
		midy = tempy;
		midu = tempu;
		midv = tempv;
		
	}

	if (midy < boty) {
	
		float 	tempx = midx, 
			tempy = midy, 
			tempu = midu, 
			tempv = midv;
		
		midx = botx;
		midy = boty;
		midu = botu;
		midv = botv;
		
		botx = tempx;
		boty = tempy;
		botu = tempu;
		botv = tempv;
	
	}

	if (topy < midy) {
	
		float 	tempx = topx, 
			tempy = topy, 
			tempu = topu, 
			tempv = topv;
		
		topx = midx;
		topy = midy;
		topu = midu;
		topv = midv;
		
		midx = tempx;
		midy = tempy;
		midu = tempu;
		midv = tempv;
	
	}

	if (topy == boty) return 2;

	float 	topbotfactor = 1.0f / (topy - boty),
		topmidfactor = 1.0f / (topy - midy + (topy == midy)),
		midbotfactor = 1.0f / (midy - boty + (midy == boty));

	float 	topbotupery = (topu - botu) * topbotfactor,
		topmidupery = (topu - midu) * topmidfactor,
		midbotupery = (midu - botu) * midbotfactor;
		
	float 	topbotvpery = (topv - botv) * topbotfactor,
		topmidvpery = (topv - midv) * topmidfactor,
		midbotvpery = (midv - botv) * midbotfactor;
		
	float 	topbotxpery = (topx - botx) * topbotfactor,
		topmidxpery = (topx - midx) * topmidfactor,
		midbotxpery = (midx - botx) * midbotfactor;
		
	float 	topbotcurx = topx,
		topmidcurx = topx,
		midbotcurx = midx;
		
	float 	topbotcuru = topu,
		topmidcuru = topu,
		midbotcuru = midu;
		
	float 	topbotcurv = topv,
		topmidcurv = topv,
		midbotcurv = midv;

	uint32_t itry = topy;
	
	while (itry > midy) {
	
		float	startx = topbotcurx, startu = topbotcuru, startv = topbotcurv,
			endx   = topmidcurx, endu   = topmidcuru, endv   = topmidcurv;
	
		if (endx < startx) {
		
			float 	tempx = endx, 
				tempu = endu, 
				tempv = endv;
			
			endx = startx;
			endu = startu;
			endv = startv;
			
			startx = tempx;
			startu = tempu;
			startv = tempv;
		
		}
		
		float xratio = 1.0f / (endx - startx + (endx == startx));
		
		float 	uratio = (endu - startu) * xratio,
			vratio = (endv - startv) * xratio;
		
		
		float 	itrx = startx,
			itru = startu,
			itrv = startv;
		
		while (itrx < endx) {
		
			dst_pixels[(uint32_t)itry * dst_width + (uint32_t)itrx] = 
				src_pixels[(uint32_t)itrv * src_width + (uint32_t)itru];
		
			itru += uratio;
			itrv += vratio;
			
			++itrx;
		}
		
	
		topbotcurx -= topbotxpery;
		topmidcurx -= topmidxpery;
		
		topbotcuru -= topbotupery;
		topmidcuru -= topmidupery;
		
		topbotcurv -= topbotvpery;
		topmidcurv -= topmidvpery;
	
		--itry;
	}
	
	while (itry > boty) {
	
		float	startx = topbotcurx, startu = topbotcuru, startv = topbotcurv,
			endx   = midbotcurx, endu   = midbotcuru, endv   = midbotcurv;
	
		if (endx < startx) {
		
			float 	tempx = endx, 
				tempu = endu, 
				tempv = endv;
			
			endx = startx;
			endu = startu;
			endv = startv;
			
			startx = tempx;
			startu = tempu;
			startv = tempv;
		
		}
		
		float xratio = 1.0f / (endx - startx);
		
		float 	uratio = (endu - startu) * xratio,
			vratio = (endv - startv) * xratio;
		
		
		float 	itrx = startx,
			itru = startu,
			itrv = startv;
		
		while (itrx < endx) {
		
			dst_pixels[(uint32_t)itry * dst_width + (uint32_t)itrx] =
				src_pixels[(uint32_t)itrv * src_width + (uint32_t)itru];
		
			itru += uratio;
			itrv += vratio;
			
			++itrx;
		}
		
	
		topbotcurx -= topbotxpery;
		midbotcurx -= midbotxpery;
		
		topbotcuru -= topbotupery;
		midbotcuru -= midbotupery;
		
		topbotcurv -= topbotvpery;
		midbotcurv -= midbotvpery;
	
		--itry;
	}

	return 0;

}

#endif
