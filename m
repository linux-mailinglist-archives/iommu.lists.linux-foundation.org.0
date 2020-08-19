Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1C249BD9
	for <lists.iommu@lfdr.de>; Wed, 19 Aug 2020 13:33:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6D28C2000E;
	Wed, 19 Aug 2020 11:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mJk0bByjDlp; Wed, 19 Aug 2020 11:33:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1FA4F203FE;
	Wed, 19 Aug 2020 11:33:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1C4FC0051;
	Wed, 19 Aug 2020 11:33:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82496C0051
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 11:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6613C864C5
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 11:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Px9I+H-H2TE for <iommu@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 11:33:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2EA128646F
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 11:33:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 270F11045;
 Wed, 19 Aug 2020 04:33:18 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39FBA3F6CF;
 Wed, 19 Aug 2020 04:33:15 -0700 (PDT)
Subject: Re: [PATCH 00/16] IOMMU driver for Kirin 960/970
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 John Stultz <john.stultz@linaro.org>
References: <cover.1597650455.git.mchehab+huawei@kernel.org>
 <5c7918b6-c506-680b-cb0f-9e5f6a7038d9@arm.com>
 <20200818172909.71f5243a@coco.lan>
 <79f40595-7769-aa6a-fbba-53adcffca327@arm.com>
 <CALAqxLXBYvwZ9kiKSGBeO5f-eKi2DD14QtoZgFGyGd-B7EOPQA@mail.gmail.com>
 <20200819122832.3cd5f834@coco.lan>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a2236994-7332-2321-20a8-3348343922f9@arm.com>
Date: Wed, 19 Aug 2020 12:33:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819122832.3cd5f834@coco.lan>
Content-Language: en-GB
Cc: driverdevel <devel@driverdev.osuosl.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Suzhuangluan <suzhuangluan@hisilicon.com>, linuxarm@huawei.com,
 Wei Xu <xuwei5@hisilicon.com>, lkml <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Chenfeng <puck.chen@hisilicon.com>, mauro.chehab@huawei.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On 2020-08-19 11:28, Mauro Carvalho Chehab wrote:
> Em Tue, 18 Aug 2020 15:02:54 -0700
> John Stultz <john.stultz@linaro.org> escreveu:
> 
>> On Tue, Aug 18, 2020 at 9:26 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>> On 2020-08-18 16:29, Mauro Carvalho Chehab wrote:
>>>> Em Tue, 18 Aug 2020 15:47:55 +0100
>>>> Basically, the DT binding has this, for IOMMU:
>>>>
>>>>
>>>>        smmu_lpae {
>>>>                compatible = "hisilicon,smmu-lpae";
>>>>        };
>>>>
>>>> ...
>>>>        dpe: dpe@e8600000 {
>>>>                compatible = "hisilicon,kirin970-dpe";
>>>>                memory-region = <&drm_dma_reserved>;
>>>> ...
>>>>                iommu_info {
>>>>                        start-addr = <0x8000>;
>>>>                        size = <0xbfff8000>;
>>>>                };
>>>>        }
>>>>
>>>> This is used by kirin9xx_drm_dss.c in order to enable and use
>>>> the iommu:
>>>>
>>>>
>>>>        static int dss_enable_iommu(struct platform_device *pdev, struct dss_hw_ctx *ctx)
>>>>        {
>>>>                struct device *dev = NULL;
>>>>
>>>>                dev = &pdev->dev;
>>>>
>>>>                /* create iommu domain */
>>>>                ctx->mmu_domain = iommu_domain_alloc(dev->bus);
>>>>                if (!ctx->mmu_domain) {
>>>>                        pr_err("iommu_domain_alloc failed!\n");
>>>>                        return -EINVAL;
>>>>                }
>>>>
>>>>                iommu_attach_device(ctx->mmu_domain, dev);
>>>>
>>>>                return 0;
>>>>        }
>>>>
>>>> The only place where the IOMMU domain is used is on this part of the
>>>> code(error part simplified here) [1]:
>>>>
>>>>        void hisi_dss_smmu_on(struct dss_hw_ctx *ctx)
>>>>        {
>>>>                uint64_t fama_phy_pgd_base;
>>>>                uint32_t phy_pgd_base;
>>>> ...
>>>>                fama_phy_pgd_base = iommu_iova_to_phys(ctx->mmu_domain, 0);
>>>>                phy_pgd_base = (uint32_t)fama_phy_pgd_base;
>>>>                if (WARN_ON(!phy_pgd_base))
>>>>                        return;
>>>>
>>>>                set_reg(smmu_base + SMMU_CB_TTBR0, phy_pgd_base, 32, 0);
>>>>        }
>>>>
>>>> [1] https://github.com/mchehab/linux/commit/36da105e719b47bbe9d6cb7e5619b30c7f3eb1bd
>>>>
>>>> In other words, the driver needs to get the physical address of the frame
>>>> buffer (mapped via iommu) in order to set some DRM-specific register.
>>>>
>>>> Yeah, the above code is somewhat hackish. I would love to replace
>>>> this part by a more standard approach.
>>>
>>> OK, so from a quick look at that, my impression is that your display
>>> controller has its own MMU and you don't need to pretend to use the
>>> IOMMU API at all. Just have the DRM driver use io-pgtable directly to
>>> run its own set of ARM_32_LPAE_S1 pagetables - see Panfrost for an
>>> example (but try to ignore the wacky "Mali LPAE" format).
>>
>> Yea. For the HiKey960, there was originally a similar patch series but
>> it was refactored out and the (still out of tree) DRM driver I'm
>> carrying doesn't seem to need it (though looking we still have the
>> iommu_info subnode in the dts that maybe needs to be cleaned up).
> 
> Funny... while the Hikey 970 DRM driver has such IOMMU code, it
> doesn't actually use it!
> 
> The driver has a function called hisi_dss_smmu_config() with
> sets the registers on a different way in order to use IOMMU
> or not, at the hisi_fb_pan_display() function. It can also
> use a mode called "afbcd".
> 
> Well, this function sets both to false:
> 
> 	bool afbcd = false;
> 	bool mmu_enable = false;
> 
> I ended commenting out the code which depends at the iommu
> driver and everything is working as before.
> 
> So, I'll just forget about this iommu driver, as we can live
> without that.
> 
> For now, I'll keep the mmu code there commented out, as
> it could be useful on a future port for it to use io-pgtable.
> 
> -
> 
> Robin,
> 
> Can the Panfrost driver use io-pgtable while the KMS driver
> won't be using it? Or this would cause it to not work?
> 
> My end goal here is to be able to test the Panfrost driver ;-)

Yup, the GPU has its own independent MMU, so Panfrost can import display 
buffers regardless of whether they're physically contiguous or not. 
Since Mesa master has recently landed AFBC support, there's probably 
more immediate benefit in getting that AFBC decoder working before the 
display MMU (although ultimately things are likely to work better under 
memory pressure if you don't have to rely on CMA, so it should still be 
worth coming back to at some point).

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
