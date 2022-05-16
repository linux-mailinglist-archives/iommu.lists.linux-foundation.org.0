Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAD2527EA3
	for <lists.iommu@lfdr.de>; Mon, 16 May 2022 09:35:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 176E081DB2;
	Mon, 16 May 2022 07:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMq8Inwr53GJ; Mon, 16 May 2022 07:34:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4B0B281DAB;
	Mon, 16 May 2022 07:34:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B2A8C007E;
	Mon, 16 May 2022 07:34:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 358DFC002D
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 07:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1074F81DB2
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 07:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id goasy-TqN7fs for <iommu@lists.linux-foundation.org>;
 Mon, 16 May 2022 07:34:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89CBF81DAB
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=w8WGy4XS5eXPvdu5YfW76lcCrip857Hkkv2txNUtWbk=; b=cWV3k/N+6vmcSCEINsuc1SyYS3
 BfmjTHk8hKu4jUjnIDxdZHymMOVX+efbSeMcixkrZjvghh6lLqsfQn2nWR+Nb8WWuwn+519/VmTMK
 IUG1/z574qcIEOO7Efev4KCTIkmUiAMfeni4g71Gb+bS9m+oZgKGYNOqZsAxdkTo3nkIiz32hxQUz
 87ixaZ+4IKzE1q16evyHuw0NSokd0xtA76pXi+/hQe2uZj/pz4UCSiG6xFUCDrznojMQ8kyn3Jpib
 M7EpBmbbtu9OrPW/54vHY2DMtxo4uOoWAd3NQIB3mJL32X3fKzFNA+Fhx206UUIo5/cR6deYR0QJE
 LVYGJI6g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nqVFh-006Ubt-57; Mon, 16 May 2022 07:34:49 +0000
Date: Mon, 16 May 2022 00:34:49 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [RFC PATCH V2 1/2] swiotlb: Add Child IO TLB mem support
Message-ID: <YoH+mbxQAp/2XGyG@infradead.org>
References: <20220502125436.23607-1-ltykernel@gmail.com>
 <20220502125436.23607-2-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220502125436.23607-2-ltykernel@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: parri.andrea@gmail.com, michael.h.kelley@microsoft.com, wei.liu@kernel.org,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, linux-hyperv@vger.kernel.org,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 iommu@lists.linux-foundation.org, kirill.shutemov@intel.com,
 thomas.lendacky@amd.com, andi.kleen@intel.com, brijesh.singh@amd.com,
 vkuznets@redhat.com, kys@microsoft.com, robin.murphy@arm.com, hch@lst.de
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

I don't really understand how 'childs' fit in here.  The code also
doesn't seem to be usable without patch 2 and a caller of the
new functions added in patch 2, so it is rather impossible to review.

Also:

 1) why is SEV/TDX so different from other cases that need bounce
    buffering to treat it different and we can't work on a general
    scalability improvement
 2) per previous discussions at how swiotlb itself works, it is
    clear that another option is to just make pages we DMA to
    shared with the hypervisor.  Why don't we try that at least
    for larger I/O?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
