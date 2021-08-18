Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 196043F027A
	for <lists.iommu@lfdr.de>; Wed, 18 Aug 2021 13:16:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EDE240188;
	Wed, 18 Aug 2021 11:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VW7B6dMyTqMa; Wed, 18 Aug 2021 11:16:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7A0384015D;
	Wed, 18 Aug 2021 11:16:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48560C000E;
	Wed, 18 Aug 2021 11:16:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0836BC000E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 11:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2422402F6
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 11:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3Et08rQY5-u for <iommu@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 11:16:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B68A9402C8
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 11:16:37 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D2D9824A; Wed, 18 Aug 2021 13:16:33 +0200 (CEST)
Date: Wed, 18 Aug 2021 13:16:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 0/2] [PULL REQUEST] iommu/vt-d: Fixes for v5.14-rc7
Message-ID: <YRzsCmd+OKvjXeeM@8bytes.org>
References: <20210817124321.1517985-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817124321.1517985-1-baolu.lu@linux.intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Yi Sun <yi.y.sun@intel.com>,
 Kumar Sanjay K <sanjay.k.kumar@intel.com>, iommu@lists.linux-foundation.org
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

On Tue, Aug 17, 2021 at 08:43:19PM +0800, Lu Baolu wrote:
> Fenghua Yu (1):
>   iommu/vt-d: Fix PASID reference leak
> 
> Liu Yi L (1):
>   iommu/vt-d: Fix incomplete cache flush in
>     intel_pasid_tear_down_entry()

Applied both, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
