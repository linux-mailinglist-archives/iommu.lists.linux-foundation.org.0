Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 160BD275D33
	for <lists.iommu@lfdr.de>; Wed, 23 Sep 2020 18:19:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9ACE985FC0;
	Wed, 23 Sep 2020 16:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WN1aNieYv8oP; Wed, 23 Sep 2020 16:19:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 905C586005;
	Wed, 23 Sep 2020 16:19:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 717C0C0051;
	Wed, 23 Sep 2020 16:19:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35056C0051
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 16:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0E34B20397
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 16:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOkpafMA63vr for <iommu@lists.linux-foundation.org>;
 Wed, 23 Sep 2020 16:19:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by silver.osuosl.org (Postfix) with ESMTPS id D305E2037B
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 16:19:46 +0000 (UTC)
IronPort-SDR: WKz6eMkUj/u36xu6GqwExnm79Ahb8g+w9rV2HjK5APvSZBiF04+2ehdDKIHVNKDZkT7EtRQysr
 9z+tDsnQZC/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="158292977"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="158292977"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 09:19:46 -0700
IronPort-SDR: n84VaKhwCX5sjOasLfcX9sZZSHECuBqTrA0blMYILMmYzE0Pj4T36LW9qYLGnfatmwHQT9Y+ru
 ISUKaQw7HwbA==
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="486496324"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.36])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 09:19:45 -0700
Date: Wed, 23 Sep 2020 09:19:44 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [bugzilla-daemon@bugzilla.kernel.org: [Bug 209149] New:
 "iommu/vt-d: Enable PCI ACS for platform opt in hint" makes NVMe config
 space not accessible after S3]
Message-ID: <20200923161944.GA17764@otc-nc-03>
References: <20200923160327.GA2267374@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923160327.GA2267374@bjorn-Precision-5520>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Joerg Roedel <jroedel@suse.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-pci@vger.kernel.org, linux-nvme@lists.infradead.org,
 Jens Axboe <axboe@fb.com>,
 Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 iommu@lists.linux-foundation.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Keith Busch <kbusch@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Rajat Jain <rajatja@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
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

Hi Bjorn


On Wed, Sep 23, 2020 at 11:03:27AM -0500, Bjorn Helgaas wrote:
> [+cc IOMMU and NVMe folks]
> 
> Sorry, I forgot to forward this to linux-pci when it was first
> reported.
> 
> Apparently this happens with v5.9-rc3, and may be related to
> 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in hint"),
> which appeared in v5.8-rc3.
> 
> There are several dmesg logs and proposed patches in the bugzilla, but
> no analysis yet of what the problem is.  From the first dmesg
> attachment (https://bugzilla.kernel.org/attachment.cgi?id=292327):

We have been investigating this internally as well. It appears maybe the
specupdate for Cometlake is missing the errata documention. The offsets
were wrong in some of them, and if its the same issue its likely cause. 

Will nudge the hw folks to hunt that down :-(.

Cheers,
Ashok
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
