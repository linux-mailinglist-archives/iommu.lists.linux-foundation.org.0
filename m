Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7997F1AD46D
	for <lists.iommu@lfdr.de>; Fri, 17 Apr 2020 04:27:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 30AEC87D41;
	Fri, 17 Apr 2020 02:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psmJXtQ3-gxG; Fri, 17 Apr 2020 02:27:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 988D287A5F;
	Fri, 17 Apr 2020 02:27:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FD15C0172;
	Fri, 17 Apr 2020 02:27:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B70AC0172
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 02:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 66C31861DE
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 02:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnVE9QlB9Q4B for <iommu@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 02:27:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C1EE686135
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 02:27:55 +0000 (UTC)
IronPort-SDR: YqEn4s07qPKa+I6d3tWXJrFqq90M9b5d6+n+cBvbUbra+x8zsu5ke02/cOkOAs9aNQBtDqe4Gx
 kv1ffvnY0uig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 19:27:55 -0700
IronPort-SDR: o9hkvLAaiO9Rb19BdwJ3FoHao5MY1QDR6RB4lAjMFbD5RyuhafnYlDuWMDlgKtfhXe28uxz0AZ
 JCgxPSKKjYdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,393,1580803200"; d="scan'208";a="299480898"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Apr 2020 19:27:54 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Apr 2020 19:27:52 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.129]) with mapi id 14.03.0439.000;
 Fri, 17 Apr 2020 10:27:49 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>
Subject: RE: [PATCH v2 6/7] iommu/vt-d: Add page request draining support
Thread-Topic: [PATCH v2 6/7] iommu/vt-d: Add page request draining support
Thread-Index: AQHWEubS8xobodm1XE6sOT1OPN2bNqh579XggAD5A4CAAa9E8A==
Date: Fri, 17 Apr 2020 02:27:49 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D824051@SHSMSX104.ccr.corp.intel.com>
References: <20200415052542.30421-1-baolu.lu@linux.intel.com>
 <20200415052542.30421-7-baolu.lu@linux.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D8209CE@SHSMSX104.ccr.corp.intel.com>
 <acf26559-49d2-653c-156d-3ef383b43879@linux.intel.com>
In-Reply-To: <acf26559-49d2-653c-156d-3ef383b43879@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Raj,
 Ashok" <ashok.raj@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

> From: Lu Baolu <baolu.lu@linux.intel.com>
> Sent: Thursday, April 16, 2020 4:38 PM
> 
> Hi Kevin,
> 
> On 2020/4/15 19:10, Tian, Kevin wrote:
> > the completion of above sequence ensures that previous queued
> > page group responses are sent out and received by the endpoint
> > and vice versa all in-fly page requests from the endpoint are queued
> > in iommu page request queue. Then comes a problem - you didn't
> > wait for completion of those newly-queued requests and their
> > responses.
> 
> I thought about this again.
> 
> We do page request draining after PASID table entry gets torn down and
> the devTLB gets invalidated. At this point, if any new page request for
> this pasid comes in, IOMMU will generate an unrecoverable fault and
> response the device with IR (Invalid Request). IOMMU won't put this page
> request into the queue. [VT-d spec 7.4.1]

Non-coverable fault implies severe errors, so I don't see why we should
allow such thing happen when handling a normal situation. if you look at
the start of chapter 7:
--
Non-recoverable Faults: Requests that encounter non-recoverable 
address translation faults are aborted by the remapping hardware, 
and typically require a reset of the device (such as through a function-
level-reset) to recover and re-initialize the device to put it back into 
service.
--

> 
> Hence, we don't need to worry about the newly-queued requests here.
> 
> Best regards,
> Baolu

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
