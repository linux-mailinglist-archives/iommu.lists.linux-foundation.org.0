Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B1903318601
	for <lists.iommu@lfdr.de>; Thu, 11 Feb 2021 09:01:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4FA3486D4D;
	Thu, 11 Feb 2021 08:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0_PvX6F9tmG; Thu, 11 Feb 2021 08:01:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC23386D55;
	Thu, 11 Feb 2021 08:01:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D719DC013A;
	Thu, 11 Feb 2021 08:01:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDF91C013A
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 08:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB4D56F53A
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 08:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jRyv_LXPKaKj for <iommu@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 08:01:04 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 228B56F501; Thu, 11 Feb 2021 08:01:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAC856F534
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 08:01:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B6C8267373; Thu, 11 Feb 2021 09:00:56 +0100 (CET)
Date: Thu, 11 Feb 2021 09:00:56 +0100
From: Christoph Hellwig <hch@lst.de>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 1/3] mm/page_alloc: Fix pageblock_order when
 HUGETLB_PAGE_ORDER >= MAX_ORDER
Message-ID: <20210211080056.GA14448@lst.de>
References: <1613024531-19040-1-git-send-email-anshuman.khandual@arm.com>
 <1613024531-19040-2-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1613024531-19040-2-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, catalin.marinas@arm.com,
 akpm@linux-foundation.org, will@kernel.org, Christoph Hellwig <hch@lst.de>,
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

> -	if (HPAGE_SHIFT > PAGE_SHIFT)
> +	if ((HPAGE_SHIFT > PAGE_SHIFT) && (HUGETLB_PAGE_ORDER < MAX_ORDER))

No need for the braces.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
