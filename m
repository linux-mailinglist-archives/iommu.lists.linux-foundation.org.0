Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC51DBBC0
	for <lists.iommu@lfdr.de>; Wed, 20 May 2020 19:42:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 167FB88A5F;
	Wed, 20 May 2020 17:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sD2RM1BTIEHH; Wed, 20 May 2020 17:42:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AADF4888E2;
	Wed, 20 May 2020 17:42:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83E94C0176;
	Wed, 20 May 2020 17:42:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4848DC0176
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 17:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 374DF88A5F
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 17:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLqaEBFoLuFN for <iommu@lists.linux-foundation.org>;
 Wed, 20 May 2020 17:42:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E69EF888E2
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 17:42:21 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C54EE68C4E; Wed, 20 May 2020 19:42:16 +0200 (CEST)
Date: Wed, 20 May 2020 19:42:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH 09/15] device core: Add ability to handle multiple dma
 offsets
Message-ID: <20200520174216.GA11770@lst.de>
References: <20200519203419.12369-1-james.quinlan@broadcom.com>
 <20200519203419.12369-10-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519203419.12369-10-james.quinlan@broadcom.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Saravana Kannan <saravanak@google.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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

If you don't Cc me on the whole series I have absolutely no way to
review it.  Don't ever do these stupid partial Ccs as they cause nothing
but pain.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
