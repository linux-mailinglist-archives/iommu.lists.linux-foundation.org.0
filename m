Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B093B2EAF
	for <lists.iommu@lfdr.de>; Thu, 24 Jun 2021 14:11:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E30F1414B8;
	Thu, 24 Jun 2021 12:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JlYfMo4Aumfg; Thu, 24 Jun 2021 12:11:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AD4F5414CB;
	Thu, 24 Jun 2021 12:11:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 751E2C0022;
	Thu, 24 Jun 2021 12:11:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9414C000E
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 12:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3CEC414C0
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 12:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXWNIMbtx2F2 for <iommu@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 12:11:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 292BF414B8
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 12:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QH9oNP4WxmW/vqhGxs1tvug21wBWTRQZH4Pz9lfIN0w=; b=fCAvHGokMgzygcSaFz3S9lmVOO
 q0dtFwlNDb6upr5nxand1xWi4g7sykXK08St9vEnu5zsOqVVESgQO5OK3sozKz2MdRukHMDbJ6x1W
 NM1tnDSi/oevECgfaVqHsQYqDQZYkgaY8inkBm+0CD/cYzV4J4LkBtsjWDCLubwdk6CLLz8hDDYkV
 YBG2YwZTIqZ7I0PG/rEwzPH5JSBoxLjels54hDDj7oJc/7AaazqK5mcIZd0HFCJu0MRCuDrxOQfSv
 FLppucvxAGePCIABaV6ZRhREoyFVRv5A6evXuwvDFv0V7Q7qNcKU+8SIYbFqvirpngMhJ5kn2q1+p
 7UyuCEeg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lwOC3-00GYDo-SO; Thu, 24 Jun 2021 12:10:58 +0000
Date: Thu, 24 Jun 2021 13:10:51 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH RFC 0/2] dma-pool: allow user to disable atomic pool
Message-ID: <YNR2S02hWS2hwNiz@infradead.org>
References: <20210624052010.5676-1-bhe@redhat.com>
 <YNQ258KHlzlajqo/@infradead.org>
 <20210624092930.GA802261@MiWiFi-R3L-srv>
 <8b3d4e02-6e94-ad59-a480-fed8e55c009a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b3d4e02-6e94-ad59-a480-fed8e55c009a@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, x86@kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, rientjes@google.com
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

On Thu, Jun 24, 2021 at 11:47:31AM +0100, Robin Murphy wrote:
> Hmm, I think the Kconfig reshuffle has actually left a slight wrinkle here.
> For DMA_DIRECT_REMAP=y we can assume an atomic pool is always needed, since
> that was the original behaviour anyway. However the implications of
> AMD_MEM_ENCRYPT=y are different - even if support is enabled, it still
> should only be relevant if mem_encrypt_active(), so it probably does make
> sense to have an additional runtime gate on that.

Yeah, a check for that would probably be useful.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
