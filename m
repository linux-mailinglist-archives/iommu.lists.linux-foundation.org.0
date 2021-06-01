Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D46396CC5
	for <lists.iommu@lfdr.de>; Tue,  1 Jun 2021 07:24:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07C0460A66;
	Tue,  1 Jun 2021 05:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tKkeo8k03Rdz; Tue,  1 Jun 2021 05:24:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B6166071E;
	Tue,  1 Jun 2021 05:24:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFA70C0024;
	Tue,  1 Jun 2021 05:24:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D11B4C0001
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 05:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C086F608CD
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 05:24:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uPttAbUaZK3g for <iommu@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 05:24:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 252F16071E
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 05:24:22 +0000 (UTC)
IronPort-SDR: CF49JV0qA19e+cIG6TL85wINcp1dLwobwQ61kncuvGfRHGPftvCwD0VEFygApIIyToav+sQ57D
 dsVXicjEq2lA==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="183835765"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="183835765"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 22:24:21 -0700
IronPort-SDR: 9/26xGdp6Lz9x66jJdkf3SzA1PYii11BJIvKVB0+a/56W0qSgeYjSmdylmkMihaKUpOfvXuquH
 x+Vy+yi2JzkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="632749269"
Received: from allen-box.sh.intel.com (HELO [10.239.159.105])
 ([10.239.159.105])
 by fmsmga006.fm.intel.com with ESMTP; 31 May 2021 22:24:16 -0700
Subject: Re: [RFC] /dev/ioasid uAPI proposal
To: Jason Wang <jasowang@redhat.com>, Liu Yi L <yi.l.liu@linux.intel.com>
References: <MWHPR11MB1886422D4839B372C6AB245F8C239@MWHPR11MB1886.namprd11.prod.outlook.com>
 <f510f916-e91c-236d-e938-513a5992d3b5@redhat.com>
 <20210531164118.265789ee@yiliu-dev>
 <78ee2638-1a03-fcc8-50a5-81040f677e69@redhat.com>
 <20210601113152.6d09e47b@yiliu-dev>
 <164ee532-17b0-e180-81d3-12d49b82ac9f@redhat.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <64898584-a482-e6ac-fd71-23549368c508@linux.intel.com>
Date: Tue, 1 Jun 2021 13:23:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <164ee532-17b0-e180-81d3-12d49b82ac9f@redhat.com>
Content-Language: en-US
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "Alex Williamson \(alex.williamson@redhat.com\)\"\""
 <alex.williamson@redhat.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>, David Woodhouse <dwmw2@infradead.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Jason W,

On 6/1/21 1:08 PM, Jason Wang wrote:
>>> 2) If yes, what's the reason for not simply use the fd opened from
>>> /dev/ioas. (This is the question that is not answered) and what happens
>>> if we call GET_INFO for the ioasid_fd?
>>> 3) If not, how GET_INFO work?
>> oh, missed this question in prior reply. Personally, no special reason
>> yet. But using ID may give us opportunity to customize the management
>> of the handle. For one, better lookup efficiency by using xarray to
>> store the allocated IDs. For two, could categorize the allocated IDs
>> (parent or nested). GET_INFO just works with an input FD and an ID.
> 
> 
> I'm not sure I get this, for nesting cases you can still make the child 
> an fd.
> 
> And a question still, under what case we need to create multiple ioasids 
> on a single ioasid fd?

One possible situation where multiple IOASIDs per FD could be used is
that devices with different underlying IOMMU capabilities are sharing a
single FD. In this case, only devices with consistent underlying IOMMU
capabilities could be put in an IOASID and multiple IOASIDs per FD could
be applied.

Though, I still not sure about "multiple IOASID per-FD" vs "multiple
IOASID FDs" for such case.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
