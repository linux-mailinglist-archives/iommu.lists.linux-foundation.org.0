Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BD25686B9
	for <lists.iommu@lfdr.de>; Wed,  6 Jul 2022 13:31:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FB4E60F19;
	Wed,  6 Jul 2022 11:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FB4E60F19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tmIXiFGNSp01; Wed,  6 Jul 2022 11:31:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AF7C260BAD;
	Wed,  6 Jul 2022 11:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF7C260BAD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79C47C0077;
	Wed,  6 Jul 2022 11:31:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3151DC002D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 11:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0535C415AF
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 11:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0535C415AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VC7q6bemcJ5m for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 11:31:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D2A408A0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29D2A408A0
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 11:31:11 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 626004CC; Wed,  6 Jul 2022 13:31:09 +0200 (CEST)
Date: Wed, 6 Jul 2022 13:31:08 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Feng Tang <feng.tang@intel.com>
Subject: Re: [PATCH v2] iommu/iova: change IOVA_MAG_SIZE to 127 to save memory
Message-ID: <YsVyfB8ygYm7owJo@8bytes.org>
References: <20220703114450.15184-1-feng.tang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220703114450.15184-1-feng.tang@intel.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Lameter <cl@linux.com>,
 Vlastimil Babka <vbabka@suse.cz>
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

On Sun, Jul 03, 2022 at 07:44:50PM +0800, Feng Tang wrote:
> kmalloc will round up the request size to power of 2, and current
> iova_magazine's size is 1032 (1024+8) bytes, so each instance
> allocated will get 2048 bytes from kmalloc, causing around 1KB
> waste.
> 
> Change IOVA_MAG_SIZE from 128 to 127 to make size of 'iova_magazine'
> 1024 bytes so that no memory will be wasted.
> 
> Signed-off-by: Feng Tang <feng.tang@intel.com>
> Acked-by: Robin Murphy <robin.murphy@arm.com>

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
