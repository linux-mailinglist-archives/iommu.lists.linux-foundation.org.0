Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F32091278EB
	for <lists.iommu@lfdr.de>; Fri, 20 Dec 2019 11:11:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9754D88841;
	Fri, 20 Dec 2019 10:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XhMDHWarjbzH; Fri, 20 Dec 2019 10:11:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6E5A288836;
	Fri, 20 Dec 2019 10:11:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DFBAC077D;
	Fri, 20 Dec 2019 10:11:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7242DC077D
 for <iommu@lists.linux-foundation.org>; Fri, 20 Dec 2019 10:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5D5CF871D3
 for <iommu@lists.linux-foundation.org>; Fri, 20 Dec 2019 10:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ik1PB2XRtvuM for <iommu@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 10:11:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5F3A28711C
 for <iommu@lists.linux-foundation.org>; Fri, 20 Dec 2019 10:11:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576836666; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fJjQDBOVdREkukt2JdGRiwD2zFis/+LRqv1PRRBxv6M=;
 b=Bb1+EKn21xAkrJXoyjlbMApF/kooWih07XLB2W1pWVfQyOou9anoOE3DqwuohbvTOlM2vkw0
 v+bFqlDOuE9yubZnuE2G+79mDzCb0FulC9L+o1ywPose1lA5/WVkVt+gRz20bpqmdLK1A7LB
 GdcMGgqbCXYm2Y0dJrgR6VYtGSQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfc9e36.7fb71ba610d8-smtp-out-n02;
 Fri, 20 Dec 2019 10:11:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ADAD5C4479D; Fri, 20 Dec 2019 10:11:01 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F0310C433CB;
 Fri, 20 Dec 2019 10:10:59 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 20 Dec 2019 15:40:59 +0530
From: smasetty@codeaurora.org
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 5/5] drm/msm/a6xx: Add support for using system cache(LLC)
In-Reply-To: <20191219195814.GA23673@jcrouse1-lnx.qualcomm.com>
References: <1576761286-20451-1-git-send-email-smasetty@codeaurora.org>
 <1576761286-20451-6-git-send-email-smasetty@codeaurora.org>
 <20191219195814.GA23673@jcrouse1-lnx.qualcomm.com>
Message-ID: <9c32a63c7300cb68e459f58a1b6fe3f8@codeaurora.org>
X-Sender: smasetty@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: freedreno@lists.freedesktop.org, will@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, dri-devel@freedesktop.org,
 robin.murphy@arm.com, linux-arm-msm-owner@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2019-12-20 01:28, Jordan Crouse wrote:
> On Thu, Dec 19, 2019 at 06:44:46PM +0530, Sharat Masetty wrote:
>> The last level system cache can be partitioned to 32 different slices
>> of which GPU has two slices preallocated. One slice is used for 
>> caching GPU
>> buffers and the other slice is used for caching the GPU SMMU 
>> pagetables.
>> This patch talks to the core system cache driver to acquire the slice 
>> handles,
>> configure the SCID's to those slices and activates and deactivates the 
>> slices
>> upon GPU power collapse and restore.
>> 
>> Some support from the IOMMU driver is also needed to make use of the
>> system cache. IOMMU_QCOM_SYS_CACHE is a buffer protection flag which 
>> enables
>> caching GPU data buffers in the system cache with memory attributes 
>> such
>> as outer cacheable, read-allocate, write-allocate for buffers. The GPU
>> then has the ability to override a few cacheability parameters which 
>> it
>> does to override write-allocate to write-no-allocate as the GPU 
>> hardware
>> does not benefit much from it.
>> 
>> Similarly DOMAIN_ATTR_QCOM_SYS_CACHE is another domain level attribute
>> used by the IOMMU driver to set the right attributes to cache the 
>> hardware
>> pagetables into the system cache.
>> 
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 122 
>> +++++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   9 +++
>>  drivers/gpu/drm/msm/msm_iommu.c       |  13 ++++
>>  drivers/gpu/drm/msm/msm_mmu.h         |   3 +
>>  4 files changed, 146 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c 
>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index faff6ff..0c7fdee 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -9,6 +9,7 @@
>>  #include "a6xx_gmu.xml.h"
>> 
>>  #include <linux/devfreq.h>
>> +#include <linux/soc/qcom/llcc-qcom.h>
>> 
>>  #define GPU_PAS_ID 13
>> 
>> @@ -781,6 +782,117 @@ static void 
>> a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
>>  	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
>>  }
>> 
>> +#define A6XX_LLC_NUM_GPU_SCIDS		5
>> +#define A6XX_GPU_LLC_SCID_NUM_BITS	5
> 
> As I mention below, I'm not sure if we need these
> 
>> +#define A6XX_GPU_LLC_SCID_MASK \
>> +	((1 << (A6XX_LLC_NUM_GPU_SCIDS * A6XX_GPU_LLC_SCID_NUM_BITS)) - 1)
>> +
>> +#define A6XX_GPUHTW_LLC_SCID_SHIFT	25
>> +#define A6XX_GPUHTW_LLC_SCID_MASK \
>> +	(((1 << A6XX_GPU_LLC_SCID_NUM_BITS) - 1) << 
>> A6XX_GPUHTW_LLC_SCID_SHIFT)
>> +
> 
> Normally these go into the envytools regmap but if we're going to do 
> these guys
> lets use the power of <linux/bitfield.h> for good.
> 
> #define A6XX_GPU_LLC_SCID GENMASK(24, 0)
> #define A6XX_GPUHTW_LLC_SCID GENMASK(29, 25)
> 
>> +static inline void a6xx_gpu_cx_rmw(struct a6xx_llc *llc,
> 
> Don't mark C functions as inline - let the compiler figure it out for 
> you.
> 
>> +	u32 reg, u32 mask, u32 or)
>> +{
>> +	msm_rmw(llc->mmio + (reg << 2), mask, or);
>> +}
>> +
>> +static void a6xx_llc_deactivate(struct a6xx_llc *llc)
>> +{
>> +	llcc_slice_deactivate(llc->gpu_llc_slice);
>> +	llcc_slice_deactivate(llc->gpuhtw_llc_slice);
>> +}
>> +
>> +static void a6xx_llc_activate(struct a6xx_llc *llc)
>> +{
>> +	if (!llc->mmio)
>> +		return;
>> +
>> +	/* Program the sub-cache ID for all GPU blocks */
>> +	if (!llcc_slice_activate(llc->gpu_llc_slice))
>> +		a6xx_gpu_cx_rmw(llc,
>> +				REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1,
>> +				A6XX_GPU_LLC_SCID_MASK,
>> +				(llc->cntl1_regval &
>> +				 A6XX_GPU_LLC_SCID_MASK));
> 
> This is out of order with the comments below, but if we store the slice 
> id then
> you could calculate regval here and not have to store it.
> 
>> +
>> +	/* Program the sub-cache ID for the GPU pagetables */
>> +	if (!llcc_slice_activate(llc->gpuhtw_llc_slice))
> 
> val |= FIELD_SET(A6XX_GPUHTW_LLC_SCID, htw_llc_sliceid);
> 
>> +		a6xx_gpu_cx_rmw(llc,
>> +				REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1,
>> +				A6XX_GPUHTW_LLC_SCID_MASK,
>> +				(llc->cntl1_regval &
>> +				 A6XX_GPUHTW_LLC_SCID_MASK));
> 
> And this could be FIELD_SET(A6XX_GPUHTW_LLC_SCID, sliceid);
> 
> In theory you could just calculate the u32 and write it directly 
> without a rmw.
> In fact, that might be preferable - if the slice activate failed, you 
> don't want
> to run the risk that the scid for htw is still populated.
> 
>> +
>> +	/* Program cacheability overrides */
>> +	a6xx_gpu_cx_rmw(llc, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF,
>> +		llc->cntl0_regval);
> 
> As below, this could easily be a constant.
> 
>> +}
>> +
>> +static void a6xx_llc_slices_destroy(struct a6xx_llc *llc)
>> +{
>> +	if (llc->mmio)
>> +		iounmap(llc->mmio);
> 
> msm_ioremap returns a devm_ managed resource, so do not use iounmap() 
> to free
> it. Bets to just leave it and let the gpu device handle it when it goes 
> boom.
> 
>> +
>> +	llcc_slice_putd(llc->gpu_llc_slice);
>> +	llcc_slice_putd(llc->gpuhtw_llc_slice);
>> +}
>> +
>> +static int a6xx_llc_slices_init(struct platform_device *pdev,
> T
> This can be void, I don't think we care if it passes or fails.
> 
>> +		struct a6xx_llc *llc)
>> +{
>> +	llc->mmio = msm_ioremap(pdev, "cx_mem", "gpu_cx");
>> +	if (IS_ERR_OR_NULL(llc->mmio))
> 
> msm_ioremap can not return NULL.
> 
>> +		return -ENODEV;
>> +
>> +	llc->gpu_llc_slice = llcc_slice_getd(LLCC_GPU);
>> +	llc->gpuhtw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
>> +	if (IS_ERR(llc->gpu_llc_slice) && IS_ERR(llc->gpuhtw_llc_slice))
>> +		return -ENODEV;
>> +
>> +	/*
>> +	 * CNTL0 provides options to override the settings for the
>> +	 * read and write allocation policies for the LLC. These
>> +	 * overrides are global for all memory transactions from
>> +	 * the GPU.
>> +	 *
>> +	 * 0x3: read-no-alloc-overridden = 0
>> +	 *      read-no-alloc = 0 - Allocate lines on read miss
>> +	 *      write-no-alloc-overridden = 1
>> +	 *      write-no-alloc = 1 - Do not allocates lines on write miss
>> +	 */
>> +	llc->cntl0_regval = 0x03;
> 
> This is a fixed value isn't it?  We should be able to get away with 
> writing a
> constant.
> 
>> +
>> +	/*
>> +	 * CNTL1 is used to specify SCID for (CP, TP, VFD, CCU and UBWC
>> +	 * FLAG cache) GPU blocks. This value will be passed along with
>> +	 * the address for any memory transaction from GPU to identify
>> +	 * the sub-cache for that transaction.
>> +	 */
>> +	if (!IS_ERR(llc->gpu_llc_slice)) {
>> +		u32 gpu_scid = llcc_get_slice_id(llc->gpu_llc_slice);
>> +		int i;
>> +
>> +		for (i = 0; i < A6XX_LLC_NUM_GPU_SCIDS; i++)
>> +			llc->cntl1_regval |=
>> +				gpu_scid << (A6XX_GPU_LLC_SCID_NUM_BITS * i);
> 
> As above, i'm not sure a loop is better than just:
> 
> gpu_scid &= 0x1f;
> 
> llc->cntl1_regval = (gpu_scid << 0) || (gpu_scid << 5) | (gpu_scid << 
> 10)
>  | (gpu_scid << 15) | (gpu_scid << 20);
> 
> And I'm not even sure we need do this math here in the first place.
> 
>> +	}
>> +
>> +	/*
>> +	 * Set SCID for GPU IOMMU. This will be used to access
>> +	 * page tables that are cached in LLC.
>> +	 */
>> +	if (!IS_ERR(llc->gpuhtw_llc_slice)) {
>> +		u32 gpuhtw_scid = llcc_get_slice_id(llc->gpuhtw_llc_slice);
>> +
>> +		llc->cntl1_regval |=
>> +			gpuhtw_scid << A6XX_GPUHTW_LLC_SCID_SHIFT;
>> +	}
> 
> As above, I think storing the slice id could be more beneficial than 
> calculating
> a value, but if we do calculate a value, use 
> FIELD_SET(A6XX_GPUHTW_LLC_SCID, )
> 
>> +
>> +	return 0;
>> +}
>> +
>>  static int a6xx_pm_resume(struct msm_gpu *gpu)
>>  {
>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> @@ -795,6 +907,8 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
>> 
>>  	msm_gpu_resume_devfreq(gpu);
>> 
>> +	a6xx_llc_activate(&a6xx_gpu->llc);
>> +
>>  	return 0;
>>  }
>> 
>> @@ -803,6 +917,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> 
>> +	a6xx_llc_deactivate(&a6xx_gpu->llc);
>> +
>>  	devfreq_suspend_device(gpu->devfreq.devfreq);
>> 
>>  	/*
>> @@ -851,6 +967,7 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>>  		drm_gem_object_put_unlocked(a6xx_gpu->sqe_bo);
>>  	}
>> 
>> +	a6xx_llc_slices_destroy(&a6xx_gpu->llc);
>>  	a6xx_gmu_remove(a6xx_gpu);
>> 
>>  	adreno_gpu_cleanup(adreno_gpu);
>> @@ -924,7 +1041,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device 
>> *dev)
>>  	adreno_gpu->registers = NULL;
>>  	adreno_gpu->reg_offsets = a6xx_register_offsets;
>> 
>> -	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1, 0);
>> +	ret = a6xx_llc_slices_init(pdev, &a6xx_gpu->llc);
>> +
> 
> Confirming we don't care if a6xx_llc_slices_init passes or fails.

Are you suggesting to unconditionally set the memory attributes in 
iommu(see the code below in msm_iommu.c).
We probably wouldn't need this patch too in that case: 
https://patchwork.freedesktop.org/patch/346097/

The return code  is used in the line below to pass 
MMU_FEATURE_USE_SYSTEM_CACHE. Am I missing something here?

> 
>> +	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1,
>> +			ret ? 0 : MMU_FEATURE_USE_SYSTEM_CACHE);
>>  	if (ret) {
>>  		a6xx_destroy(&(a6xx_gpu->base.base));
>>  		return ERR_PTR(ret);
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h 
>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 7239b8b..09b9ad0 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -12,6 +12,14 @@
>> 
>>  extern bool hang_debug;
>> 
>> +struct a6xx_llc {
>> +	void __iomem *mmio;
>> +	void *gpu_llc_slice;
>> +	void *gpuhtw_llc_slice;
>> +	u32 cntl0_regval;
> 
> As above, I'm not sure if cntl0 is needed.  Heck, I'm not even sure 
> cntl1 is
> needed - since we could store or query the ids at activate time.
> 
>> +	u32 cntl1_regval;
>> +};
>> +
>>  struct a6xx_gpu {
>>  	struct adreno_gpu base;
>> 
>> @@ -21,6 +29,7 @@ struct a6xx_gpu {
>>  	struct msm_ringbuffer *cur_ring;
>> 
>>  	struct a6xx_gmu gmu;
>> +	struct a6xx_llc llc;
>>  };
>> 
>>  #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
>> diff --git a/drivers/gpu/drm/msm/msm_iommu.c 
>> b/drivers/gpu/drm/msm/msm_iommu.c
>> index 8c95c31..4699367 100644
>> --- a/drivers/gpu/drm/msm/msm_iommu.c
>> +++ b/drivers/gpu/drm/msm/msm_iommu.c
>> @@ -27,6 +27,16 @@ static int msm_iommu_attach(struct msm_mmu *mmu, 
>> const char * const *names,
>>  			    int cnt)
>>  {
>>  	struct msm_iommu *iommu = to_msm_iommu(mmu);
>> +	int gpu_htw_llc = 1;
>> +
>> +	/*
>> +	 * This allows GPU to set the bus attributes required
>> +	 * to use system cache on behalf of the iommu page table
>> +	 * walker.
>> +	 */
>> +	if (msm_mmu_has_feature(mmu, MMU_FEATURE_USE_SYSTEM_CACHE))
>> +		iommu_domain_set_attr(iommu->domain,
>> +				DOMAIN_ATTR_QCOM_SYS_CACHE, &gpu_htw_llc);
> 
> We're all okay if this fails?  No harm no foul?
> 
>> 
>>  	return iommu_attach_device(iommu->domain, mmu->dev);
>>  }
>> @@ -45,6 +55,9 @@ static int msm_iommu_map(struct msm_mmu *mmu, 
>> uint64_t iova,
>>  	struct msm_iommu *iommu = to_msm_iommu(mmu);
>>  	size_t ret;
>> 
>> +	if (msm_mmu_has_feature(mmu, MMU_FEATURE_USE_SYSTEM_CACHE))
>> +		prot |= IOMMU_QCOM_SYS_CACHE;
>> +
>>  	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
>>  	WARN_ON(!ret);
>> 
>> diff --git a/drivers/gpu/drm/msm/msm_mmu.h 
>> b/drivers/gpu/drm/msm/msm_mmu.h
>> index 1e4ac36d..3e6bdad 100644
>> --- a/drivers/gpu/drm/msm/msm_mmu.h
>> +++ b/drivers/gpu/drm/msm/msm_mmu.h
>> @@ -18,6 +18,9 @@ struct msm_mmu_funcs {
>>  	void (*destroy)(struct msm_mmu *mmu);
>>  };
>> 
>> +/* MMU features */
>> +#define MMU_FEATURE_USE_SYSTEM_CACHE (1 << 0)
>> +
>>  struct msm_mmu {
>>  	const struct msm_mmu_funcs *funcs;
>>  	struct device *dev;
>> --
>> 1.9.1
>> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
