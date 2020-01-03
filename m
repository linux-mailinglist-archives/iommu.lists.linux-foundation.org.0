Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C217C12F238
	for <lists.iommu@lfdr.de>; Fri,  3 Jan 2020 01:33:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7DC2B81EFD;
	Fri,  3 Jan 2020 00:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwX8N4+3Zrp8; Fri,  3 Jan 2020 00:33:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BB37081DC5;
	Fri,  3 Jan 2020 00:33:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB0DAC077D;
	Fri,  3 Jan 2020 00:33:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CB3DC077D
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jan 2020 00:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0F3412044E
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jan 2020 00:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xhlALIf3jSmQ for <iommu@lists.linux-foundation.org>;
 Fri,  3 Jan 2020 00:33:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by silver.osuosl.org (Postfix) with ESMTPS id 57C8D203AD
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jan 2020 00:33:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jan 2020 16:33:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,388,1571727600"; d="scan'208";a="244753228"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by fmsmga004.fm.intel.com with ESMTP; 02 Jan 2020 16:33:25 -0800
Subject: Re: [PATCH 22/22] iommu/vt-d: Add a quirk flag for scope mismatched
 devices
To: Roland Dreier <roland@purestorage.com>
References: <20200102001823.21976-1-baolu.lu@linux.intel.com>
 <20200102001823.21976-23-baolu.lu@linux.intel.com>
 <CAL1RGDWU=s6nVArvkci1cXyZVw-fvdtcOjuY+9E+rgBi65q=Aw@mail.gmail.com>
 <567f1506-4a13-535b-ce41-aac079941510@linux.intel.com>
 <CAL1RGDVF1icaeEWMe0r0VA8AaxtHGJZ8NHCpvJfT8+1duOUYAQ@mail.gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <5097d738-352b-92ad-c8ac-0b3e2805aa97@linux.intel.com>
Date: Fri, 3 Jan 2020 08:32:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAL1RGDVF1icaeEWMe0r0VA8AaxtHGJZ8NHCpvJfT8+1duOUYAQ@mail.gmail.com>
Content-Language: en-US
Cc: Jim Yan <jimyan@baidu.com>, iommu@lists.linux-foundation.org
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

Hi Roland,

Jim proposed another solution.

https://lkml.org/lkml/2019/12/23/653

Does this work for you?

Best regards,
baolu

On 1/2/20 10:25 AM, Roland Dreier wrote:
>> We saw more devices with the same mismatch quirk. So maintaining them in
>> a quirk table will make it more readable and maintainable.
> 
> I guess I disagree about the maintainable part, given that this patch
> already regresses Broadwell NTB.
> 
> I'm not even sure what the DMAR table says about NTB on my Skylake
> systems, exactly because the existing code means I did not have any
> problems.  But we might need to add device 201Ch too.
> 
> Maybe we don't need the mismatch check at all?  Your patch sets the
> quirk if any possibly mismatching device is present in the system, so
> we'll ignore any scope mismatch on a system with, say, the 8086:2020
> NVMe host in it.  So could we just drop the check completely and not
> have a quirk to disable the check?
> 
>   - R.
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
