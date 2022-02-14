Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B5F4B42D6
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 08:33:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 385944018A;
	Mon, 14 Feb 2022 07:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQLvwpwXQHy9; Mon, 14 Feb 2022 07:33:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6C3C2401EF;
	Mon, 14 Feb 2022 07:33:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2ADB5C0073;
	Mon, 14 Feb 2022 07:33:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 683D4C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 07:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D1DD81406
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 07:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cfWpPJaWMMJW for <iommu@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 07:33:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6E5381373
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 07:33:25 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 87B1568AFE; Mon, 14 Feb 2022 08:33:22 +0100 (CET)
Date: Mon, 14 Feb 2022 08:33:22 +0100
From: Christoph Hellwig <hch@lst.de>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 08/11] iommu/vt-d: Fix indentation of goto labels
Message-ID: <20220214073322.GD17411@lst.de>
References: <20220214025704.3184654-1-baolu.lu@linux.intel.com>
 <20220214025704.3184654-9-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214025704.3184654-9-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jason Gunthorpe <jgg@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

On Mon, Feb 14, 2022 at 10:57:01AM +0800, Lu Baolu wrote:
> Remove blanks before goto labels.

The blanks are still pretty common in parts of the kernel, buf if you
want them gone that sounds fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
