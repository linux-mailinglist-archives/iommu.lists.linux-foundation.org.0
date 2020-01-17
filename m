Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CEA1407DB
	for <lists.iommu@lfdr.de>; Fri, 17 Jan 2020 11:22:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EEF4820530;
	Fri, 17 Jan 2020 10:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2jiT8dvO7Jb; Fri, 17 Jan 2020 10:22:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4155E2040C;
	Fri, 17 Jan 2020 10:22:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2296EC077D;
	Fri, 17 Jan 2020 10:22:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50979C077D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 10:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 41136220EF
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 10:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G326kED+SoXv for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 10:21:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id B639C2040C
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jan 2020 10:21:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 11BFA327; Fri, 17 Jan 2020 11:21:52 +0100 (CET)
Date: Fri, 17 Jan 2020 11:21:51 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [RFC PATCH 3/4] iommu: Preallocate iommu group when probing
 devices
Message-ID: <20200117102151.GF15760@8bytes.org>
References: <20200101052648.14295-1-baolu.lu@linux.intel.com>
 <20200101052648.14295-4-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200101052648.14295-4-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kevin.tian@intel.com, ashok.raj@intel.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
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

On Wed, Jan 01, 2020 at 01:26:47PM +0800, Lu Baolu wrote:
> This splits iommu group allocation from adding devices. This makes
> it possible to determine the default domain type for each group as
> all devices belonging to the group have been determined.

I think its better to keep group allocation as it is and just defer
default domain allocation after each device is in its group. But take
care about the device hotplug path which might add new devices to groups
which already have a default domain, or add new groups that might need a
default domain too.

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
