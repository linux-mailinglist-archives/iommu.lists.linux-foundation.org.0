Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DD8228C7F
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 01:11:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B19A988270;
	Tue, 21 Jul 2020 23:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vY4JRO5r+AfK; Tue, 21 Jul 2020 23:11:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 303BB8824D;
	Tue, 21 Jul 2020 23:11:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25DA5C016F;
	Tue, 21 Jul 2020 23:11:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33497C016F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 23:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 177B520453
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 23:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLI4HmUANgYo for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 23:11:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by silver.osuosl.org (Postfix) with ESMTPS id C09C62041F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 23:11:37 +0000 (UTC)
IronPort-SDR: kDJY7DG3gtmNepfKcwufbewgFqKcDGGmvI423RUsestsmfkdGmHpL7qM4UUhTTzFXJTDtV0ar0
 bX0F2Ad9yT9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="214889055"
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="214889055"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 16:11:36 -0700
IronPort-SDR: UkdvjQPsfhGCtfdh2igIhtlU+U1RScxgkXHZLfUkKlV9tZJ34r5zXMkIfBCKgKaTZzegujEIOO
 FFJGEm/aNdNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="462248054"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by orsmga005.jf.intel.com with ESMTP; 21 Jul 2020 16:11:34 -0700
Subject: Re: [PATCH 1/1] iommu/vt-d: Skip TE disabling on quirky gfx dedicated
 iommu
To: "Limonciello, Mario" <Mario.Limonciello@dell.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20200721001713.24282-1-baolu.lu@linux.intel.com>
 <DM6PR19MB2636D1CC549743E2113C0EAFFA780@DM6PR19MB2636.namprd19.prod.outlook.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <d8548318-ee2e-ca3f-cb0a-e219ce23d471@linux.intel.com>
Date: Wed, 22 Jul 2020 07:06:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB2636D1CC549743E2113C0EAFFA780@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Language: en-US
Cc: Ashok Raj <ashok.raj@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Koba Ko <koba.ko@canonical.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

Hi Limonciello,

On 7/21/20 10:44 PM, Limonciello, Mario wrote:
>> -----Original Message-----
>> From: iommu<iommu-bounces@lists.linux-foundation.org>  On Behalf Of Lu
>> Baolu
>> Sent: Monday, July 20, 2020 7:17 PM
>> To: Joerg Roedel
>> Cc: Ashok Raj;linux-kernel@vger.kernel.org;stable@vger.kernel.org; Koba
>> Ko;iommu@lists.linux-foundation.org
>> Subject: [PATCH 1/1] iommu/vt-d: Skip TE disabling on quirky gfx dedicated
>> iommu
>>
>> The VT-d spec requires (10.4.4 Global Command Register, TE field) that:
>>
>> Hardware implementations supporting DMA draining must drain any in-flight
>> DMA read/write requests queued within the Root-Complex before completing
>> the translation enable command and reflecting the status of the command
>> through the TES field in the Global Status register.
>>
>> Unfortunately, some integrated graphic devices fail to do so after some
>> kind of power state transition. As the result, the system might stuck in
>> iommu_disable_translation(), waiting for the completion of TE transition.
>>
>> This provides a quirk list for those devices and skips TE disabling if
>> the qurik hits.
>>
>> Fixes:https://bugzilla.kernel.org/show_bug.cgi?id=208363
> That one is for TGL.
> 
> I think you also want to add this one for ICL:
> Fixes:https://bugzilla.kernel.org/show_bug.cgi?id=206571
> 

Do you mean someone have tested that this patch also fixes the problem
described in 206571?

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
