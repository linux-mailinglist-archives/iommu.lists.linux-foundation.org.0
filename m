Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB9169C9C
	for <lists.iommu@lfdr.de>; Mon, 24 Feb 2020 04:23:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E163D85521;
	Mon, 24 Feb 2020 03:23:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06WWapNAI1aG; Mon, 24 Feb 2020 03:23:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A779D8535F;
	Mon, 24 Feb 2020 03:23:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9861BC18DA;
	Mon, 24 Feb 2020 03:23:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5F72C0177
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 03:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9B4D5862B2
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 03:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LYI+R3P4EJBQ for <iommu@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 03:23:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D8A7A860DC
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 03:23:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Feb 2020 19:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,478,1574150400"; d="scan'208";a="237183930"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by orsmga003.jf.intel.com with ESMTP; 23 Feb 2020 19:23:17 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.140]) by
 ORSMSX101.amr.corp.intel.com ([169.254.8.110]) with mapi id 14.03.0439.000;
 Sun, 23 Feb 2020 19:23:16 -0800
From: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH V2 2/5] iommu/vt-d: Rename device_def_domain_type() to
 intel_iommu_dev_def_domain_type()
Thread-Topic: [PATCH V2 2/5] iommu/vt-d: Rename device_def_domain_type() to
 intel_iommu_dev_def_domain_type()
Thread-Index: AQHV6dnA0onVtsx7O0e6VJZpV6j606gn49HggACl4YCAASX1UA==
Date: Mon, 24 Feb 2020 03:23:16 +0000
Message-ID: <FFF73D592F13FD46B8700F0A279B802F572178AB@ORSMSX114.amr.corp.intel.com>
References: <cover.1581619464.git.sai.praneeth.prakhya@intel.com>
 <cd79477f93816a4b0940a8f6770327772b9786af.1581619464.git.sai.praneeth.prakhya@intel.com>
 <5cbc8651-3a7f-95fa-3db0-704cb15978f5@linux.intel.com>
 <FFF73D592F13FD46B8700F0A279B802F572054FD@ORSMSX114.amr.corp.intel.com>
 <682f468c-3c16-0a21-c67b-0305545d85fe@linux.intel.com>
In-Reply-To: <682f468c-3c16-0a21-c67b-0305545d85fe@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
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

> >> On 2020/2/17 5:57, Sai Praneeth Prakhya wrote:
> >>> The functionality needed for iommu_ops->dev_def_domain_type() is
> >>> already provided by device_def_domain_type() in intel_iommu.c. But,
> >>> every call back function in intel_iommu_ops starts with intel_iommu
> >>> prefix, hence rename
> >>> device_def_domain_type() to intel_iommu_dev_def_domain_type() so
> >>> that it follows the same semantics.
> >>
> >> How about keep device_def_domain_type() and call it in the new
> >> intel_iommu_dev_def_domain_type()?
> >
> > Sure! I could but could you please explain the advantages we might get by
> doing so?
> > Less number of changes is what I could think of.. any other reasons?
> >
> 
> device_def_domain_type() is a quirk list for devices that must use a specified
> domain type. intel_iommu_dev_def_domain_type() tells the upper layer whether
> the device could switch to another type of domain. Put them in separated
> functions will make it easier for maintenance.

Ok. Will fix this.

Regards,
Sai
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
