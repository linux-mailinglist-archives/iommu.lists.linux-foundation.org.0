Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AFB476B55
	for <lists.iommu@lfdr.de>; Thu, 16 Dec 2021 09:02:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3761C60FBF;
	Thu, 16 Dec 2021 08:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AUoZLhL8SSxK; Thu, 16 Dec 2021 08:02:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4F60E60FC9;
	Thu, 16 Dec 2021 08:02:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 258EDC0012;
	Thu, 16 Dec 2021 08:02:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5729BC0012
 for <iommu@lists.linux-foundation.org>; Thu, 16 Dec 2021 08:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 447BD40ADF
 for <iommu@lists.linux-foundation.org>; Thu, 16 Dec 2021 08:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZcbpVRe_BDD for <iommu@lists.linux-foundation.org>;
 Thu, 16 Dec 2021 08:02:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACA9D40AD3
 for <iommu@lists.linux-foundation.org>; Thu, 16 Dec 2021 08:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zeVgdZekYVoCGoOE4CcwJQVXY4jKJylsxXTQbazh+cE=; b=an6HXGxmAx1lVJmu2Y3Kix0OAZ
 HNpsqt7EP9RrYvtl97awiKnppOtpZjZNNuZ0N60kHHqe9PxYfe05lpd/JCekTOmpvzp23mHtnYxzx
 pLD48v92RM40acXVUJgzWKXxzb7WoCCkWt/JsZSQozXyrtvxo8rBRPL8VffUtbJepW6RTxhIcXPPZ
 nX9g4s+q93ka0UqgxtMgqGtz3wj+3s2jV5NrLkkmv+Cxc18M5J0jJqlhcKEklUUgE+Ux35VNoxFL4
 oyQrQwavtZ76NGW+9/DYjS1Fvjaa37pYDB3DIC+I6F2HK32CJ+GF3aXV+GByJTTufHGonBSRKaEh1
 ok4CSTyw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mxlit-0042S8-0Y; Thu, 16 Dec 2021 08:02:43 +0000
Date: Thu, 16 Dec 2021 00:02:42 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 05/11] iommu/iova: Squash flush_cb abstraction
Message-ID: <Ybryoh61+htoulPN@infradead.org>
References: <cover.1639157090.git.robin.murphy@arm.com>
 <6326303c396e28fd3b9ed89d82673dfcf159b8c6.1639157090.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6326303c396e28fd3b9ed89d82673dfcf159b8c6.1639157090.git.robin.murphy@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, will@kernel.org
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

> @@ -147,7 +142,7 @@ struct iova *reserve_iova(struct iova_domain *iovad, unsigned long pfn_lo,
>  	unsigned long pfn_hi);
>  void init_iova_domain(struct iova_domain *iovad, unsigned long granule,
>  	unsigned long start_pfn);
> -int init_iova_flush_queue(struct iova_domain *iovad, iova_flush_cb flush_cb);
> +int init_iova_flush_queue(struct iova_domain *iovad, struct iommu_domain *fq_domain);

Overly long line here.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
