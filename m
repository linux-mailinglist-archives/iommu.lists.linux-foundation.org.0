Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6419C1669E8
	for <lists.iommu@lfdr.de>; Thu, 20 Feb 2020 22:33:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0C88220378;
	Thu, 20 Feb 2020 21:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQPvwappLfQc; Thu, 20 Feb 2020 21:33:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 08348203EC;
	Thu, 20 Feb 2020 21:33:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7751C1D84;
	Thu, 20 Feb 2020 21:33:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DD49C1D84
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 21:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4B385860E6
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 21:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F916gnxF9nt3 for <iommu@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 21:33:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8A635860E0
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 21:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582234425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4krYsiGh4Qek2SxgzuI/KbmEgksVX0a4JTAhD8CZkok=;
 b=i7KIDtT2qzdeIwMS+kdn6IK52lTALdEjC6u6zrd+LdWkpf3nqi5gn3luBkzwAhm9gtJDzu
 NscLpGEswyyFnrtTbuAorD8wtz3Ig0n1jgs27oJG4RJB4k4cGkPcQz35Ex3I9zzLKSGy0H
 hIXgpbJBSWKHSpBLWyfBPgBSVFH84nE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-W4z4cfx3OWaXceCpMVnm0g-1; Thu, 20 Feb 2020 16:33:43 -0500
Received: by mail-qt1-f200.google.com with SMTP id c22so75230qtn.23
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 13:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4krYsiGh4Qek2SxgzuI/KbmEgksVX0a4JTAhD8CZkok=;
 b=YlvWwRuVsV5WRq9VZeLuVyw7Yayi5HgmnfGjDqFEDa2SoWwApA/CHQMn366QjIuAvN
 fW4SIzSDHGnQ5obZSlDEUcDl4Y9qhuciV6nv4W9c8QscjemSXOaBCrz80ZeEhWTbaaRS
 5hkF1JzgE7auu8j5fuensFRQYStVr4/YQv9/FLzGkBS509sN/t+LsOXyaCZk5PAForbz
 khm/oU3KLRnwHx9WookDy5Wd4ui6e0z57AqjIVmw/eLHNM5i2t4RONX0BJxYh5WFe+Na
 P2vKeN+yZqZb3sMDcb3oWFTmCkhTzOkbH07zTtqclPVhbsSDadK37sXe1yB0JFXFykZ4
 5CeA==
X-Gm-Message-State: APjAAAVjyjXXbsmLxNxJtmW1QrSF3GRB+M8tPFKoA56xcBJBTSRz9YbX
 ybTUShcInhzb5R+betp1B96K49ajKlK6jnaGI10nJ1EN/vAT9PkcY59LT/BQbPrzJD7x+6ZOMvW
 Jy7sgGwqbGmedMVI7JmFA4/66SSP2Bg==
X-Received: by 2002:ac8:4886:: with SMTP id i6mr27992241qtq.160.1582234423178; 
 Thu, 20 Feb 2020 13:33:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqykw+sIvY+6jifxdk4U8bBDoR068zA6NinyMfSe1te1gvQyzZNHuu8TE0YuobirJ95QLhxL3g==
X-Received: by 2002:ac8:4886:: with SMTP id i6mr27992229qtq.160.1582234422979; 
 Thu, 20 Feb 2020 13:33:42 -0800 (PST)
Received: from redhat.com (bzq-109-67-14-209.red.bezeqint.net. [109.67.14.209])
 by smtp.gmail.com with ESMTPSA id z27sm440818qtv.11.2020.02.20.13.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 13:33:42 -0800 (PST)
Date: Thu, 20 Feb 2020 16:33:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 0/2] virtio: decouple protected guest RAM form
 VIRTIO_F_IOMMU_PLATFORM
Message-ID: <20200220163055-mutt-send-email-mst@kernel.org>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20200220160606.53156-1-pasic@linux.ibm.com>
X-MC-Unique: W4z4cfx3OWaXceCpMVnm0g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, David Gibson <david@gibson.dropbear.id.au>,
 Michael Mueller <mimu@linux.ibm.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Thu, Feb 20, 2020 at 05:06:04PM +0100, Halil Pasic wrote:
> For vhost-net the feature VIRTIO_F_IOMMU_PLATFORM has the following side
> effect The vhost code assumes it the addresses on the virtio descriptor
> ring are not guest physical addresses but iova's, and insists on doing a
> translation of these regardless of what transport is used (e.g. whether
> we emulate a PCI or a CCW device). (For details see commit 6b1e6cc7855b
> "vhost: new device IOTLB API".) On s390 this results in severe
> performance degradation (c.a. factor 10). BTW with ccw I/O there is
> (architecturally) no IOMMU, so the whole address translation makes no
> sense in the context of virtio-ccw.

So it sounds like a host issue: the emulation of s390 unnecessarily complicated.
Working around it by the guest looks wrong ...

> Halil Pasic (2):
>   mm: move force_dma_unencrypted() to mem_encrypt.h
>   virtio: let virtio use DMA API when guest RAM is protected
> 
>  drivers/virtio/virtio_ring.c |  3 +++
>  include/linux/dma-direct.h   |  9 ---------
>  include/linux/mem_encrypt.h  | 10 ++++++++++
>  3 files changed, 13 insertions(+), 9 deletions(-)
> 
> 
> base-commit: ca7e1fd1026c5af6a533b4b5447e1d2f153e28f2
> -- 
> 2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
