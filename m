Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EEB15037
	for <lists.iommu@lfdr.de>; Mon,  6 May 2019 17:28:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4ED9E48D2;
	Mon,  6 May 2019 15:28:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B14C54886
	for <iommu@lists.linux-foundation.org>;
	Mon,  6 May 2019 15:27:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0F895196
	for <iommu@lists.linux-foundation.org>;
	Mon,  6 May 2019 15:27:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c5so17791880wrs.11
	for <iommu@lists.linux-foundation.org>;
	Mon, 06 May 2019 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arista.com; s=googlenew;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GuMSdmXl0z53dDi0xhlaU7BU2n/bLw/DBUWaPvlO+dc=;
	b=C/d9PWiZ7kbJC0oH7zo5Ibhtjb0LJxg5WGRhk2z22dgXTR0ahak265kLVZyGYOhfje
	aEtSmh42RRvz8bCCBZRBFOn7uv5XCF0ECqKL0Hb338d0yPodqMwGb1L0gvRyJgITkaxQ
	Ki1y61sbdbPypKRjDCxUR8MH0zfn/bbro9LPpFVyLBByJZzEOqelQf5tS81MK2FkUIP3
	sLhve+NsmP0dlDX03w14Qjs93JrqJwcC/r4yHUZhJhCv/72E7VCM80drfYcNtln/9ipb
	cKIyK6t7ROv023pVx/00hbtubgQCmfBlIjzs3E6R48gtIILod1LUINjWV6UVWZ8tSjxH
	BBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GuMSdmXl0z53dDi0xhlaU7BU2n/bLw/DBUWaPvlO+dc=;
	b=f0+ATD7DOFPNcPxaJZW3FFYd3KY4g407knoTvde7s3FWkmMmrb50BQFbiMvtxUszUu
	o4DT4oHBRW93eXIiJJjX2/fu789gVfWUeaphjX6+tAcUhf5wWBBc2IrU/05Y5SfMsZ4a
	ROdS6GOXyD4dAR+qCICLzV1TKuYVk2NQ0uyolQ84psUpCBUAgaDQW7mU19/g0R/NW5SG
	yaQzEDhktIqPcfOHsYXUovmhoXZklqIwfTELZQCIMx/GHKmbcZwHDvnuhgOjkCTEnzTs
	SKgB4FRxw6C8UG380d6rB8w0rySrPcz7W4tzts+cu7lPy74IyTIJrcMFr0m8pcYK9YDB
	Q2Nw==
X-Gm-Message-State: APjAAAWE270JuXJQKirUf0grxr//K322Ld8XqLhpqUiRPUFC+m2/Pice
	a7BoiQ7Z0vJSk4sEkDhY1cFwLMQZmRGlb+QIs5SuLA==
X-Google-Smtp-Source: APXvYqzdYjq2KzNwXSYRUYk147h4YL+JNa0zWfymURRoAL7aXQogilrHn37rwl9PoIS46ayzMGu+Ikwm2tOs7SUKN4Y=
X-Received: by 2002:a5d:5551:: with SMTP id g17mr20082024wrw.50.1557156440752; 
	Mon, 06 May 2019 08:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190504132327.27041-1-tmurphy@arista.com>
	<20190504132327.27041-2-tmurphy@arista.com>
	<8fef18f5-773c-e1c9-2537-c9dff5bfd35e@linux.intel.com>
In-Reply-To: <8fef18f5-773c-e1c9-2537-c9dff5bfd35e@linux.intel.com>
Date: Mon, 6 May 2019 16:27:09 +0100
Message-ID: <CAPL0++4_Qa+dxzQ2k6BJi_o+VSSrHEtomYgVmRqjtjsOfHbGew@mail.gmail.com>
Subject: Re: [RFC 1/7] iommu/vt-d: Set the dma_ops per device so we can remove
	the iommu_no_mapping code
To: Lu Baolu <baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org,
	Will Deacon <will.deacon@arm.com>, David Brown <david.brown@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	iommu@lists.linux-foundation.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Kukjin Kim <kgene@kernel.org>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	Andy Gross <andy.gross@linaro.org>, linux-tegra@vger.kernel.org,
	Marc Zyngier <marc.zyngier@arm.com>, linux-arm-msm@vger.kernel.org,
	Alex Williamson <alex.williamson@redhat.com>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
	David Woodhouse <dwmw2@infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
From: Tom Murphy via iommu <iommu@lists.linux-foundation.org>
Reply-To: Tom Murphy <tmurphy@arista.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, May 6, 2019 at 2:48 AM Lu Baolu <baolu.lu@linux.intel.com> wrote:
>
> Hi,
>
> On 5/4/19 9:23 PM, Tom Murphy wrote:
> > Set the dma_ops per device so we can remove the iommu_no_mapping code.
> >
> > Signed-off-by: Tom Murphy<tmurphy@arista.com>
> > ---
> >   drivers/iommu/intel-iommu.c | 85 +++----------------------------------
> >   1 file changed, 6 insertions(+), 79 deletions(-)
> >
> > diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> > index eace915602f0..2db1dc47e7e4 100644
> > --- a/drivers/iommu/intel-iommu.c
> > +++ b/drivers/iommu/intel-iommu.c
> > @@ -2622,17 +2622,6 @@ static int __init si_domain_init(int hw)
> >       return 0;
> >   }
> >
> > -static int identity_mapping(struct device *dev)
> > -{
> > -     struct device_domain_info *info;
> > -
> > -     info = dev->archdata.iommu;
> > -     if (info && info != DUMMY_DEVICE_DOMAIN_INFO)
> > -             return (info->domain == si_domain);
> > -
> > -     return 0;
> > -}
> > -
> >   static int domain_add_dev_info(struct dmar_domain *domain, struct device *dev)
> >   {
> >       struct dmar_domain *ndomain;
> > @@ -3270,43 +3259,6 @@ static unsigned long intel_alloc_iova(struct device *dev,
> >       return iova_pfn;
> >   }
> >
> > -/* Check if the dev needs to go through non-identity map and unmap process.*/
> > -static int iommu_no_mapping(struct device *dev)
> > -{
> > -     int found;
> > -
> > -     if (iommu_dummy(dev))
> > -             return 1;
> > -
> > -     found = identity_mapping(dev);
> > -     if (found) {
> > -             /*
> > -              * If the device's dma_mask is less than the system's memory
> > -              * size then this is not a candidate for identity mapping.
> > -              */
> > -             u64 dma_mask = *dev->dma_mask;
> > -
> > -             if (dev->coherent_dma_mask &&
> > -                 dev->coherent_dma_mask < dma_mask)
> > -                     dma_mask = dev->coherent_dma_mask;
> > -
> > -             if (dma_mask < dma_get_required_mask(dev)) {
> > -                     /*
> > -                      * 32 bit DMA is removed from si_domain and fall back
> > -                      * to non-identity mapping.
> > -                      */
> > -                     dmar_remove_one_dev_info(dev);
> > -                     dev_warn(dev, "32bit DMA uses non-identity mapping\n");
> > -
> > -                     return 0;
> > -             }
>
> The iommu_no_mapping() also checks whether any 32bit DMA device uses
> identity mapping. The device might not work if the system memory space
> is bigger than 4G.

It looks like their is actually a bug in the v3 of the "iommu/vt-d:
Delegate DMA domain to generic iommu" patch set. I will leave a
message in that email thread. Fixing that bug should also fix this
issue.


>
> Will you add this to other place, or it's unnecessary?
>
> Best regards,
> Lu Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
