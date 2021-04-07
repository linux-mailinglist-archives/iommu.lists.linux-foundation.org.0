Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EF535661E
	for <lists.iommu@lfdr.de>; Wed,  7 Apr 2021 10:10:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1C7D8489B;
	Wed,  7 Apr 2021 08:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K1hc-y4pAjAm; Wed,  7 Apr 2021 08:10:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CAD584898;
	Wed,  7 Apr 2021 08:10:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07E3DC000A;
	Wed,  7 Apr 2021 08:10:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1B7AC000A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82FD640209
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nUFjI8WcOyK for <iommu@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 08:10:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0380A400BF
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 08:10:22 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 848732A6; Wed,  7 Apr 2021 10:10:20 +0200 (CEST)
Date: Wed, 7 Apr 2021 10:10:18 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 1/1] iommu/vt-d: Don't set then clear private data in
 prq_event_thread()
Message-ID: <YG1o6tlQ9phFHCe4@8bytes.org>
References: <20210320024156.640798-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210320024156.640798-1-baolu.lu@linux.intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>
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

On Sat, Mar 20, 2021 at 10:41:56AM +0800, Lu Baolu wrote:
>  drivers/iommu/intel/svm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
