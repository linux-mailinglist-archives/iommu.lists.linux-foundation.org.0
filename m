Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ED16311DDE1
	for <lists.iommu@lfdr.de>; Fri, 13 Dec 2019 06:42:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C6388712B;
	Fri, 13 Dec 2019 05:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_xBEtXlTBcM; Fri, 13 Dec 2019 05:42:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67BDB87126;
	Fri, 13 Dec 2019 05:42:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EB8BC0881;
	Fri, 13 Dec 2019 05:42:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB507C0881
 for <iommu@lists.linux-foundation.org>; Fri, 13 Dec 2019 05:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A4FED88279
 for <iommu@lists.linux-foundation.org>; Fri, 13 Dec 2019 05:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yALRXbC7fPWD for <iommu@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 05:42:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 85717881E9
 for <iommu@lists.linux-foundation.org>; Fri, 13 Dec 2019 05:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576215723;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IJgA3g5rXpxfPvcvokZkSoK7EAZvchQ854pBNfGuCgI=;
 b=g0eJ4aaCCIZbHeO8DBS/U1XFL56dLG++ttrwQtbysg+PlWYFG+FvPCQ5CwU8YK3oB5HhOa
 thOaB3fc0vAjM3WDPNW5Z4hktCX3utQ+MtLKr8+AsjrLuBZQzJ8Y6Eyld2pKrBbdmEIGuE
 qf3/kUU5DnLrfKbZoERt3t1Ds+JBwpM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-VbAjZoUkOkKnxn7EYqAvuw-1; Fri, 13 Dec 2019 00:41:41 -0500
X-MC-Unique: VbAjZoUkOkKnxn7EYqAvuw-1
Received: by mail-qk1-f198.google.com with SMTP id 65so735400qkl.23
 for <iommu@lists.linux-foundation.org>; Thu, 12 Dec 2019 21:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=IJgA3g5rXpxfPvcvokZkSoK7EAZvchQ854pBNfGuCgI=;
 b=MUq5dRoYoULi7bpc/+rumYhYDuUryiS54FxGFkw6sf/nMF08Av2KnCfxLOEk31tj94
 IZA1ujuyL1HkdVehBzwyQG9OtUa+CD/Muh8qKpq+pxrcnwMOMTy6cVOwQ3fc/eMSKGWu
 siCplBzJnkUQrE7bQAG/ErmhMLrWn1LV50Ek+YbwYT/gk8I/030PtvKWoz2UzEtWSN68
 d2a21muWnkoD3bXpclMBHwu7axlLrb2IMwf6cl9GLUcn6b9QXNArx+jGWrK7KXY9v3bS
 s+IVSUiNLutF4RjIPKDVTZlZ2Z96qowyZLYYNEjGPIcfKbdgle+HXfjnNkbzjSAdk6S/
 16MQ==
X-Gm-Message-State: APjAAAXrV7UxpNRlv6MzeDR7tpRqQGOzp49w8uzgTGgMlE/+j04wN5yc
 2ch9D4TMT1ovlzSbpZKbfvFf3IeGl70RtO1oq8EO/tWA4OlMy57V7w6lb3LX6vgmIskr6RJ8R/1
 WzR02RwlHKS1sD5xtGi94fHvQweCK3g==
X-Received: by 2002:ac8:7547:: with SMTP id b7mr11154244qtr.263.1576215700966; 
 Thu, 12 Dec 2019 21:41:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqy2H0GRrwZfxEcTjm45unP2WdHFZR+j4bqd86Mzax2aSt8Y85Lvw2Mcj9vYfaqlerYs30Hbhw==
X-Received: by 2002:ac8:7547:: with SMTP id b7mr11154222qtr.263.1576215700674; 
 Thu, 12 Dec 2019 21:41:40 -0800 (PST)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id o26sm3065444qtj.58.2019.12.12.21.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 21:41:39 -0800 (PST)
Date: Thu, 12 Dec 2019 22:41:13 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] iommu/vt-d: Set ISA bridge reserved region as relaxable
Message-ID: <20191213054113.fzjkiaud3ahs2n3s@cantor>
References: <157609608124.14870.10855090013879818212.stgit@gimli.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157609608124.14870.10855090013879818212.stgit@gimli.home>
Cc: eauger@redhat.com, cprt@protonmail.com, iommu@lists.linux-foundation.org
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

On Wed Dec 11 19, Alex Williamson wrote:
>Commit d850c2ee5fe2 ("iommu/vt-d: Expose ISA direct mapping region via
>iommu_get_resv_regions") created a direct-mapped reserved memory region
>in order to replace the static identity mapping of the ISA address
>space, where the latter was then removed in commit df4f3c603aeb
>("iommu/vt-d: Remove static identity map code").  According to the
>history of this code and the Kconfig option surrounding it, this direct
>mapping exists for the benefit of legacy ISA drivers that are not
>compatible with the DMA API.
>
>In conjuntion with commit 9b77e5c79840 ("vfio/type1: check dma map
>request is within a valid iova range") this change introduced a
>regression where the vfio IOMMU backend enforces reserved memory regions
>per IOMMU group, preventing userspace from creating IOMMU mappings
>conflicting with prescribed reserved regions.  A necessary prerequisite
>for the vfio change was the introduction of "relaxable" direct mappings
>introduced by commit adfd37382090 ("iommu: Introduce
>IOMMU_RESV_DIRECT_RELAXABLE reserved memory regions").  These relaxable
>direct mappings provide the same identity mapping support in the default
>domain, but also indicate that the reservation is software imposed and
>may be relaxed under some conditions, such as device assignment.
>
>Convert the ISA bridge direct-mapped reserved region to relaxable to
>reflect that the restriction is self imposed and need not be enforced
>by drivers such as vfio.
>
>Fixes: d850c2ee5fe2 ("iommu/vt-d: Expose ISA direct mapping region via iommu_get_resv_regions")
>Cc: stable@vger.kernel.org # v5.3+
>Link: https://lore.kernel.org/linux-iommu/20191211082304.2d4fab45@x1.home
>Reported-by: cprt <cprt@protonmail.com>
>Tested-by: cprt <cprt@protonmail.com>
>Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

Tested-by: Jerry Snitselaar <jsnitsel@redhat.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

>---
> drivers/iommu/intel-iommu.c |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
>index 0c8d81f56a30..6eb0dd7489a1 100644
>--- a/drivers/iommu/intel-iommu.c
>+++ b/drivers/iommu/intel-iommu.c
>@@ -5737,7 +5737,7 @@ static void intel_iommu_get_resv_regions(struct device *device,
>
> 		if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_ISA) {
> 			reg = iommu_alloc_resv_region(0, 1UL << 24, 0,
>-						      IOMMU_RESV_DIRECT);
>+						   IOMMU_RESV_DIRECT_RELAXABLE);
> 			if (reg)
> 				list_add_tail(&reg->list, head);
> 		}
>
>_______________________________________________
>iommu mailing list
>iommu@lists.linux-foundation.org
>https://lists.linuxfoundation.org/mailman/listinfo/iommu
>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
