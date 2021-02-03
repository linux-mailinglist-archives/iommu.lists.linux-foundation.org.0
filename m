Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7777530D0F4
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 02:46:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0ABC6868B2;
	Wed,  3 Feb 2021 01:46:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OEtl+hmhbgnk; Wed,  3 Feb 2021 01:46:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7CB88868B1;
	Wed,  3 Feb 2021 01:46:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CCC0C013A;
	Wed,  3 Feb 2021 01:46:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12936C013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 01:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 049FE85516
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 01:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbSa39zhb9Mn for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 01:46:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4A130854B4
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 01:46:00 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id c127so3809759wmf.5
 for <iommu@lists.linux-foundation.org>; Tue, 02 Feb 2021 17:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NA+Vp6FOxTsN0rhRmqWACq/BX4WRBLfi30qX+qsu3WA=;
 b=pAFQ38fj4r/BasPAvMLNQe+108j256tvT/jZiRNbzIYyZeKz4jQqRAc7n0CgGe+FbT
 /sKq4I/sjRMZLhUtLKwxAiKHU0Gg9aBU4Zo4EN+3qShSaTNVWiwk7Vib8u4QSvcbBZHe
 rahywyW8WRbvWpRPrutG/9MVWGQg6maeku9tHP20/RfbWWknqnKUeVadlDQyUSKk64oP
 xgvUtuP8f3UZGjFHsYViHRsKsQd/V/bi4fezrs6Dmu2wTzdit6JXDFvlLNBqBWJC2Iy4
 BGAiXzg0nlYAEITmGVPHc38u70jbFCSkB9wjJqFzQujaLFdKXHHAJxesNLJ9hdS/DCnC
 QgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NA+Vp6FOxTsN0rhRmqWACq/BX4WRBLfi30qX+qsu3WA=;
 b=bzeKeu36l/HnfvtULxcijNl0muhHjOk6Zes9RmQVik09c1MI9jtabN8GCSRsLFtBd3
 CD6zwJJdaCaHE8aPMdlHldN+3aPW2g9aZgghZyTThytPBiVFF78AxMlt0tskk8mCW3Gm
 CZaKNybdUH5v2wFlf3m2JE5irIzRur4mlx/frsMSE1WTWsH7KrsXLhVRCnSkAUDQHRx3
 o8X0E2toBJFZV3aYN3t9bm1uSORy3ZQKplkL/Oq6KmYybbJER0P1hqOS4wgKKjQj5Bix
 HtDufWhzEyQIJDWVQziusocXIydxt0oApjFsBQmfC1YHmW16OHiDAsCSPWT6Oq8IxdW7
 D67Q==
X-Gm-Message-State: AOAM531EMFZ1W0BksECKyKjD4C/AMFW3tN/YAvvKcvRJp5s3i4nJwHKg
 HraIrIvcv0Qawfq5Dmw1PGnfuuE2CO0L/J3LM04=
X-Google-Smtp-Source: ABdhPJweWJm9bNSHZ1fcDogI4a6pspPbN1XKVhCcuzUdgLu8xCK2ZtvzgwGygNuVi1YcLZZ9N82vivx7UxB18K4ahT8=
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr629304wmj.58.1612316758120;
 Tue, 02 Feb 2021 17:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20210202073258.559443-3-zhang.lyra@gmail.com>
 <20210202104257.736836-1-zhang.lyra@gmail.com>
 <20210202141349.GB32671@8bytes.org>
In-Reply-To: <20210202141349.GB32671@8bytes.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 3 Feb 2021 09:45:21 +0800
Message-ID: <CAAfSe-uGeji18yZaqEWAS1W-_3Fmvnq_7PQmGE7hhGs4r+Mcvg@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu: add Unisoc iommu basic driver
To: Joerg Roedel <joro@8bytes.org>
Cc: DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>, Sheng Xu <sheng.xu@unisoc.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Robin Murphy <robin.murphy@arm.com>
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

On Tue, 2 Feb 2021 at 22:14, Joerg Roedel <joro@8bytes.org> wrote:
>
> On Tue, Feb 02, 2021 at 06:42:57PM +0800, Chunyan Zhang wrote:
> > +static phys_addr_t sprd_iommu_iova_to_phys(struct iommu_domain *domain,
> > +                                        dma_addr_t iova)
> > +{
> > +     struct sprd_iommu_domain *dom = to_sprd_domain(domain);
> > +     unsigned long flags;
> > +     phys_addr_t pa;
> > +     unsigned long start = domain->geometry.aperture_start;
> > +     unsigned long end = domain->geometry.aperture_end;
> > +
> > +     if (iova < start || iova > end)
> > +             pr_err("iova (0x%llx) exceed the vpn range[0x%lx-0x%lx]!\n",
> > +                    iova, start, end);
>
> It is not a good idea to continue here with an out-of-range iova. The
> code below might access random memory for its checks. Better do a
> WARN_ON here and return an invalid physical address.

Yes, I will fix this.

Thanks,
Chunyan

>
> > +
> > +     spin_lock_irqsave(&dom->pgtlock, flags);
> > +     pa = *(dom->pgt_va + ((iova - start) >> SPRD_IOMMU_PAGE_SHIFT));
> > +     pa = (pa << SPRD_IOMMU_PAGE_SHIFT) + ((iova - start) & (SPRD_IOMMU_PAGE_SIZE - 1));
> > +     spin_unlock_irqrestore(&dom->pgtlock, flags);
> > +
> > +     return pa;
> > +}
> > +
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
