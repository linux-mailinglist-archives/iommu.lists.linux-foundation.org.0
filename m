Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB6411B8EC
	for <lists.iommu@lfdr.de>; Wed, 11 Dec 2019 17:35:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3BDE888402;
	Wed, 11 Dec 2019 16:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PMhV4y1umWE7; Wed, 11 Dec 2019 16:35:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6ED88883C8;
	Wed, 11 Dec 2019 16:35:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E460C1D83;
	Wed, 11 Dec 2019 16:35:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30157C0881
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 16:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 255ED86B05
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 16:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQIqpuYsI21u for <iommu@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 16:35:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7292E86AE3
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 16:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576082137;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=G2ZB3omzRfSfFMjDrR0LBqamRCs0vWgnzAtR96DPAFU=;
 b=TBZmtIH8PN8dWdMGlZxjiDmI9JZx/31WBjsVncYt2fLHWhEEOCaPzzEfsnDqKubXVrCWBn
 wOWmrhwOmN1FDQZLsXpAa55dm9KHfRHQReVOQwoq/UtAQLIjycdCiHHW5gOBr6I7CYCbO5
 djJIYcQzl86cmCB/h/ZFHMj2lft6Fjw=
Received: from mail-yw1-f70.google.com (mail-yw1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-klkNrgB-N6SmWDV_rq5SZg-1; Wed, 11 Dec 2019 11:35:35 -0500
X-MC-Unique: klkNrgB-N6SmWDV_rq5SZg-1
Received: by mail-yw1-f70.google.com with SMTP id j9so17789923ywg.14
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 08:35:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=G2ZB3omzRfSfFMjDrR0LBqamRCs0vWgnzAtR96DPAFU=;
 b=dvUbDRWaVLrPx2++TUu7qkS3IIi4+G0j6U3u4FvYDx3I3162OEuq1xxVEhf7AMhfAD
 cfZswzf66BzIbM6KUxbSU6fdDTN7Pg4Mkq2M4oQ6BYLUDekX2BlHXuLG2WBayELqIB5b
 QeM5mY9v7sbD+yzxb3Qd40BbwB/AJmTMAB6Zz7MB81I3f82fmjWqYBv5w4jtXZaLGikO
 eEWn8jIBs6Rhq3czv65LOkFC62JF17wpCAUe2lcqBzzUZr8CFZrTSAXngDJ6PCNxbe5Y
 AKIyfjlv0zt0F/0IZNBP+doG+2+X1t3lFSS9poZJ7ur2hxyT7xeZBbvuAFNTX5Qz30LH
 ra0A==
X-Gm-Message-State: APjAAAXjMMQDE163bXdHedncTCbbzBgGoptk8aqL6BAehsxFDWvzVg1z
 FX0omCFj7TekWfG6yxYSoT3LanNKGZHCQfOSDhxQrqAYuxlMtVNQ+ld6J/KrC6c/G4J8BlPON3l
 ufcIGK+vCEg8XEmzStneXD1ShzWGiVA==
X-Received: by 2002:a81:de03:: with SMTP id k3mr496988ywj.504.1576082135412;
 Wed, 11 Dec 2019 08:35:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQSheQ86BeD+t6fYx16LhovjTZbO/zkP9rZdQVuw6RgshPVg8mCAb+RC0yN7OH2NIGsZ9xUg==
X-Received: by 2002:a81:de03:: with SMTP id k3mr496966ywj.504.1576082135136;
 Wed, 11 Dec 2019 08:35:35 -0800 (PST)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id l74sm1168529ywc.45.2019.12.11.08.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 08:35:34 -0800 (PST)
Date: Wed, 11 Dec 2019 09:35:11 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Fix dmar pte read access not set error
Message-ID: <20191211163511.gjju2s3yy4sus44w@cantor>
Mail-Followup-To: Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, ashok.raj@intel.com,
 jacob.jun.pan@intel.com, kevin.tian@intel.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20191211014015.7898-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211014015.7898-1-baolu.lu@linux.intel.com>
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, iommu@lists.linux-foundation.org,
 jacob.jun.pan@intel.com, David Woodhouse <dwmw2@infradead.org>
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed Dec 11 19, Lu Baolu wrote:
>If the default DMA domain of a group doesn't fit a device, it
>will still sit in the group but use a private identity domain.
>When map/unmap/iova_to_phys come through iommu API, the driver
>should still serve them, otherwise, other devices in the same
>group will be impacted. Since identity domain has been mapped
>with the whole available memory space and RMRRs, we don't need
>to worry about the impact on it.
>

Does this pose any potential issues with the reverse case where the
group has a default identity domain, and the first device fits that,
but a later device in the group needs dma and gets a private dma
domain?

>Link: https://www.spinics.net/lists/iommu/msg40416.html
>Cc: Jerry Snitselaar <jsnitsel@redhat.com>
>Reported-by: Jerry Snitselaar <jsnitsel@redhat.com>
>Fixes: 942067f1b6b97 ("iommu/vt-d: Identify default domains replaced with private")
>Cc: stable@vger.kernel.org # v5.3+
>Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>---
> drivers/iommu/intel-iommu.c | 8 --------
> 1 file changed, 8 deletions(-)
>
>diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
>index 0c8d81f56a30..b73bebea9148 100644
>--- a/drivers/iommu/intel-iommu.c
>+++ b/drivers/iommu/intel-iommu.c
>@@ -5478,9 +5478,6 @@ static int intel_iommu_map(struct iommu_domain *domain,
> 	int prot = 0;
> 	int ret;
>
>-	if (dmar_domain->flags & DOMAIN_FLAG_LOSE_CHILDREN)
>-		return -EINVAL;
>-
> 	if (iommu_prot & IOMMU_READ)
> 		prot |= DMA_PTE_READ;
> 	if (iommu_prot & IOMMU_WRITE)
>@@ -5523,8 +5520,6 @@ static size_t intel_iommu_unmap(struct iommu_domain *domain,
> 	/* Cope with horrid API which requires us to unmap more than the
> 	   size argument if it happens to be a large-page mapping. */
> 	BUG_ON(!pfn_to_dma_pte(dmar_domain, iova >> VTD_PAGE_SHIFT, &level));
>-	if (dmar_domain->flags & DOMAIN_FLAG_LOSE_CHILDREN)
>-		return 0;
>
> 	if (size < VTD_PAGE_SIZE << level_to_offset_bits(level))
> 		size = VTD_PAGE_SIZE << level_to_offset_bits(level);
>@@ -5556,9 +5551,6 @@ static phys_addr_t intel_iommu_iova_to_phys(struct iommu_domain *domain,
> 	int level = 0;
> 	u64 phys = 0;
>
>-	if (dmar_domain->flags & DOMAIN_FLAG_LOSE_CHILDREN)
>-		return 0;
>-
> 	pte = pfn_to_dma_pte(dmar_domain, iova >> VTD_PAGE_SHIFT, &level);
> 	if (pte)
> 		phys = dma_pte_addr(pte);
>-- 
>2.17.1
>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
