Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D03CA04E
	for <lists.iommu@lfdr.de>; Thu, 15 Jul 2021 16:09:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4B8460791;
	Thu, 15 Jul 2021 14:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5Rl8Fad2dG9; Thu, 15 Jul 2021 14:09:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F3E9660B8D;
	Thu, 15 Jul 2021 14:09:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C300DC001F;
	Thu, 15 Jul 2021 14:09:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F03A6C000E
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 14:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDC6B401E8
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 14:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aQl4NnPXRVFi for <iommu@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 14:08:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 948FF400B5
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 14:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iebZcPmz53/ZFsseaBIp65cM35oKWZNccJfgrLe9Dpw=; b=soCXyTJWEWCSeztKhGtSi6vTHX
 p94VYVx6v0t218YpSFHE784gmhmXUJQqxv2uydJUq8+x/dntVTCJ2pfyc8MpcPQNyn4NQypCsSowr
 6YHsMK4kYP0D+krSqT1VxnEeYNL1Qfq2CL3V4aO08qZvExlHIQki2sQ6DhD6NQ+T1Wx7mUtLvSYyR
 fkxR8CekNlXTpgt8/703Ofk33s0rVOn6HZPfM0S0mkd9W6g+b8DJiM53+Vp6pzkRSJ85A73ytGG3z
 QpxQc4/wMP/6qUWBygmJSCFJzP9jSjcjwB982KcpUu71BDYXSxgURt/KWyi5KQ8onvt+jY2pC6rC3
 HYYnsFdA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m421V-003Puk-EA; Thu, 15 Jul 2021 14:07:43 +0000
Date: Thu, 15 Jul 2021 15:07:33 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] iommu: Streamline iommu_iova_to_phys()
Message-ID: <YPBBJUWvFixPpFYF@infradead.org>
References: <f564f3f6ff731b898ff7a898919bf871c2c7745a.1626354264.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f564f3f6ff731b898ff7a898919bf871c2c7745a.1626354264.git.robin.murphy@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: will@kernel.org, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Jul 15, 2021 at 02:04:24PM +0100, Robin Murphy wrote:
> If people are going to insist on calling iommu_iova_to_phys()
> pointlessly and expecting it to work,

Maybe we need to fix that?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
