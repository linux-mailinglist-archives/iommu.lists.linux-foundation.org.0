Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A64630D6
	for <lists.iommu@lfdr.de>; Tue, 30 Nov 2021 11:16:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC7D48175F;
	Tue, 30 Nov 2021 10:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qow8x_IgU5bG; Tue, 30 Nov 2021 10:16:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 09FA581769;
	Tue, 30 Nov 2021 10:16:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D01D3C0030;
	Tue, 30 Nov 2021 10:16:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8373FC000A
 for <iommu@lists.linux-foundation.org>; Tue, 30 Nov 2021 10:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61FFF81769
 for <iommu@lists.linux-foundation.org>; Tue, 30 Nov 2021 10:16:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsnEIpp9Hg-3 for <iommu@lists.linux-foundation.org>;
 Tue, 30 Nov 2021 10:16:03 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
Received: from outbound-smtp48.blacknight.com (outbound-smtp48.blacknight.com
 [46.22.136.219])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B084681768
 for <iommu@lists.linux-foundation.org>; Tue, 30 Nov 2021 10:16:03 +0000 (UTC)
Received: from mail.blacknight.com (pemlinmail03.blacknight.ie [81.17.254.16])
 by outbound-smtp48.blacknight.com (Postfix) with ESMTPS id A9726FAF40
 for <iommu@lists.linux-foundation.org>; Tue, 30 Nov 2021 10:08:55 +0000 (GMT)
Received: (qmail 25169 invoked from network); 30 Nov 2021 10:08:55 -0000
Received: from unknown (HELO techsingularity.net)
 (mgorman@techsingularity.net@[84.203.17.29])
 by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated);
 30 Nov 2021 10:08:55 -0000
Date: Tue, 30 Nov 2021 10:08:53 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [RFC PATCH 0/3] Use pageblock_order for cma and
 alloc_contig_range alignment.
Message-ID: <20211130100853.GP3366@techsingularity.net>
References: <20211115193725.737539-1-zi.yan@sent.com>
 <3083463d-978b-fbe6-dadf-670d400ed437@suse.cz>
 <AEFF28CF-0ED8-450F-96A4-A6CD59CB1F3D@nvidia.com>
 <BF8FB68A-6E1D-4465-8A2B-884FC034660B@nvidia.com>
 <52dbf824-76be-cc34-3983-d45510b1b618@suse.cz>
 <35A20739-152A-450E-8535-2236D2B28748@nvidia.com>
 <1c67bb96-24db-f5a6-7520-3d97e54e5192@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c67bb96-24db-f5a6-7520-3d97e54e5192@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: David Hildenbrand <david@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Zi Yan <ziy@nvidia.com>,
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

On Tue, Nov 30, 2021 at 10:11:36AM +0100, Vlastimil Babka wrote:
> >>> I find that two pageblocks with different migratetypes, like MIGRATE_RECLAIMABLE
> >>> and MIGRATE_MOVABLE can be merged into a single free page after I checked
> >>> __free_one_page() in detail and printed pageblock information during buddy page
> >>> merging.
> >>
> >> Yes, that can happen.
> >>
> >> I am not sure what consequence it will cause. Do you have any idea?
> >>
> >> For MIGRATE_RECLAIMABLE or MIGRATE_MOVABLE or even MIGRATE_UNMOVABLE it's
> >> absolutely fine. As long as these pageblocks are fully free (and they are if
> >> it's a single free page spanning 2 pageblocks), they can be of any of these
> >> type, as they can be reused as needed without causing fragmentation.
> >>
> >> But in case of MIGRATE_CMA and MIGRATE_ISOLATE, uncontrolled merging would
> >> break the specifics of those types. That's why the code is careful for
> >> MIGRATE_ISOLATE, and MIGRATE_CMA was until now done in MAX_ORDER granularity.
> > 
> > Thanks for the explanation. Basically migratetypes that can fall back to each
> > other can be merged into a single free page, right?
> 
> Yes.
> 
> > How about MIGRATE_HIGHATOMIC? It should not be merged with other migratetypes
> > from my understanding.
> 
> Hmm it shouldn't minimally because it has an accounting that would become
> broken. So it should prevent merging or make sure the reservations are with
> MAX_ORDER granularity, but seems that neither is true? CCing Mel.
> 

MIGRATE_HIGHATOMIC pageblocks can have pages allocated of different
types, particularly UNMOVABLE and potentially RECLAIMABLE. The
reserving or releasing MIGRATE_HIGHATOMIC pageblocks should be done with
reserve_highatomic_pageblock and unreserve_highatomic_pageblock to get
the accounting right.

However, there does not appear to be any special protection against a
page in a highatomic pageblock getting merged with a buddy of another
pageblock type. The pageblock would still have the right setting but on
allocation, the pages could split to the wrong free list and be lost
until the pages belonging to MIGRATE_HIGHATOMIC were freed again.

Not sure how much of a problem that is in practice, it's been a while
since I've heard of high-order atomic allocation failures.

-- 
Mel Gorman
SUSE Labs
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
