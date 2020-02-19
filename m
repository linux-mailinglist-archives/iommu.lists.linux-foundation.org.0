Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E9B163C59
	for <lists.iommu@lfdr.de>; Wed, 19 Feb 2020 06:04:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BEA1D204B2;
	Wed, 19 Feb 2020 05:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fi4JZA9vB9hy; Wed, 19 Feb 2020 05:04:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C99BA203E4;
	Wed, 19 Feb 2020 05:04:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFAAAC1D84;
	Wed, 19 Feb 2020 05:04:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3FFBC013E
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 04:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9D2C0855D8
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 04:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3b+BWFLYnkJ5 for <iommu@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 04:42:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E793884F5A
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 04:42:37 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id 12so1991571pjb.5
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 20:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=61OocmFXfIGcFYNFByokYBG/4ziTRZISrOn1saiNmT4=;
 b=GBiw5tKonmB0LtOmsi1mPxYIGd+b/sFcmRWAf7AC3rQdacFHmLy4o4Dj+J6sm1uz+j
 LHpTNaqXEX9wnuQYxiuXZpG6yrbM9cXruQ/hB3NDdsUz6yuRNUjB20N1MNbmUtSg4wL4
 KJEGEYKoas/5ogRSJIfBsjb04TU2useD1HfqV++Rgexs3mmMoD5sdZd8/YvKIei13nfc
 AVwqcPQmxdah4Z3VV/a25nIUGwThZjByJ+op37fXwaX4j+KNbEiJPvy+4CiYlCN4z4dG
 l0lRkD41iQnsqP9NnESbcSbkuJm6x3Dc2sWXa2WmnQC9DpgurIkPcio3A9DuknvnD9GW
 YfxA==
X-Gm-Message-State: APjAAAUJd2cFJISiR/7kD4NgDv5rZKCiGN+CiO1SnECzlC8P0n55kpZ7
 gkTZt4gtFkXN3XPDmYFH27c=
X-Google-Smtp-Source: APXvYqxJD6SNEjxUXuioSJ1Sxn1SDbrcbyFDinc05gUM2ntSPrJYd873VULqjKBt+kgUqCyfodlveA==
X-Received: by 2002:a17:902:8303:: with SMTP id
 bd3mr24703694plb.171.1582087357323; 
 Tue, 18 Feb 2020 20:42:37 -0800 (PST)
Received: from localhost ([2601:647:5b00:710:ffa7:88dc:9c39:76d9])
 by smtp.gmail.com with ESMTPSA id f3sm684493pfg.115.2020.02.18.20.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 20:42:36 -0800 (PST)
Date: Tue, 18 Feb 2020 20:42:35 -0800
From: Moritz Fischer <mdf@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] iommu/vt-d: Fix a bug in intel_iommu_iova_to_phys() for
 huge page
Message-ID: <20200219044235.GA1397@epycbox.lan>
References: <20200218222324.231915-1-yonghyun@google.com>
 <8efc6ea2-d51e-624c-5cc2-4049bb224122@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8efc6ea2-d51e-624c-5cc2-4049bb224122@linux.intel.com>
X-Mailman-Approved-At: Wed, 19 Feb 2020 05:04:40 +0000
Cc: Yonghyun Hwang <yonghyun@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Deepa Dinamani <deepadinamani@google.com>,
 Moritz Fischer <moritzf@google.com>, David Woodhouse <dwmw2@infradead.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Baolu, Yonghyun

On Wed, Feb 19, 2020 at 11:15:36AM +0800, Lu Baolu wrote:
> Hi Yonghyun,
> 
> Thanks for the patch.
> 
> On 2020/2/19 6:23, Yonghyun Hwang wrote:
> > intel_iommu_iova_to_phys() has a bug when it translates an IOVA for a huge
> > page onto its corresponding physical address. This commit fixes the bug by
> > accomodating the level of page entry for the IOVA and adds IOVA's lower
> > address to the physical address. >
> > Signed-off-by: Yonghyun Hwang <yonghyun@google.com>
> > ---
> >   drivers/iommu/intel-iommu.c | 11 +++++++++--
> >   1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> > index 0c8d81f56a30..ed6e69adb578 100644
> > --- a/drivers/iommu/intel-iommu.c
> > +++ b/drivers/iommu/intel-iommu.c
> > @@ -5555,13 +5555,20 @@ static phys_addr_t intel_iommu_iova_to_phys(struct iommu_domain *domain,
> >   	struct dma_pte *pte;
> >   	int level = 0;
> >   	u64 phys = 0;
> > +	const unsigned long pfn = iova >> VTD_PAGE_SHIFT;
> 
> Why do you need a "const unsigned long" here?
> 
> >   	if (dmar_domain->flags & DOMAIN_FLAG_LOSE_CHILDREN)
> >   		return 0;
> > -	pte = pfn_to_dma_pte(dmar_domain, iova >> VTD_PAGE_SHIFT, &level);
> > -	if (pte)
> > +	pte = pfn_to_dma_pte(dmar_domain, pfn, &level);
> > +	if (pte) {
> >   		phys = dma_pte_addr(pte);
> > +		if (level > 1)
> > +			phys += (pfn &
> > +				((1UL << level_to_offset_bits(level)) - 1))
> > +				<< VTD_PAGE_SHIFT;
> > +		phys += iova & (VTD_PAGE_SIZE - 1);
> 
> How about

> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 9dc37672bf89..bd17c2510bb2 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -5693,8 +5693,14 @@ static phys_addr_t intel_iommu_iova_to_phys(struct
> iommu_domain *domain,
>         u64 phys = 0;
> 
>         pte = pfn_to_dma_pte(dmar_domain, iova >> VTD_PAGE_SHIFT, &level);
> -       if (pte)
> +       if (pte) {
> +               unsigned long offset_mask;
> +
> +               offset_mask = BIT_MASK(level_to_offset_bits(level) +
> +                                      VTD_PAGE_SHIFT) - 1;
>                 phys = dma_pte_addr(pte);
> +               phys += iova & (bitmask - 1);
Did you mean:

phys += iova & (offset_mask - 1);

> +       }

At that point why not define a helper:

static inline unsigned long offset_mask(int level)
{
	return BIT_MASK(level_to_offset_bits(level) + VTD_PAGE_SHIFT) - 1;
}

At which point the above would reduce to:

if (pte)
	phys = dma_pte_addr(pte) + iova & offset_mask(level) - 1;

I might've fatfingered something here, but you get the idea :)

Cheers,
Moritz
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
