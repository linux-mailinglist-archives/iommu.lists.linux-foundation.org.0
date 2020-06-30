Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6570C20EFE2
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 09:52:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0CD8887AD1;
	Tue, 30 Jun 2020 07:52:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ENhZ8RdLLsZ; Tue, 30 Jun 2020 07:52:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A13287781;
	Tue, 30 Jun 2020 07:52:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26D7DC016E;
	Tue, 30 Jun 2020 07:52:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D512C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 07:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 490A486B9A
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 07:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HEN5qFBJT5wh for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 07:52:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 551ED86B7D
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 07:52:45 +0000 (UTC)
IronPort-SDR: EOZ9/XucizsS364KalZgk7BQWddcdR1+QiWRuXzgtrb3LTTkMDSn1cQs24iDCUNF0pIlB7LUwq
 VnVZETchr+Mg==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="164181080"
X-IronPort-AV: E=Sophos;i="5.75,296,1589266800"; d="scan'208";a="164181080"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 00:52:44 -0700
IronPort-SDR: eGGj2t6g5LUU1YhVwky6xRMNCWEVLwnbATlY9tpArRmc7dT1GHG5j1QV6jPn1Wb22N2/pWvd7O
 F2WuH6iRJGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,296,1589266800"; d="scan'208";a="266412260"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.249.173.186])
 ([10.249.173.186])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jun 2020 00:52:41 -0700
Subject: Re: [Issue]platform/x86: iommu: System can't shutdown because iommu
 driver keeps checking the status of DMA_GSTS_TES
To: Koba Ko <koba.ko@canonical.com>
References: <CAJB-X+Ww=bZN2qZ=e=4EkN_RUTiZxHxkdnHh50y9iVqZmT_XQg@mail.gmail.com>
 <111dde48-8018-6d74-5df8-1534143f4de6@linux.intel.com>
 <CAJB-X+WgjKR3PgoF_tn_g__+agCSGJpyB8sh+A62gs0qztDuVQ@mail.gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <66cacbab-b04d-33f3-053e-4d554ac7c662@linux.intel.com>
Date: Tue, 30 Jun 2020 15:52:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAJB-X+WgjKR3PgoF_tn_g__+agCSGJpyB8sh+A62gs0qztDuVQ@mail.gmail.com>
Content-Language: en-US
Cc: "Sun, Jian" <jian.sun@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Kai Heng Feng <kai.heng.feng@canonical.com>,
 David Woodhouse <dwmw2@infradead.org>
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

Hi Koba,

On 2020/6/30 15:31, Koba Ko wrote:
> On Mon, Jun 15, 2020 at 3:20 PM Lu Baolu <baolu.lu@linux.intel.com> wrote:
>>
>> Hi Koba Ko,
>>
>> On 2020/6/15 11:19, Koba Ko wrote:
>>> hi All,
>>> I have a machine and there's only intel gpu.
>>> the secureboot and vt-d is enabled in BIOS.
>>> On the Ubuntu desktop, I do s2idle first and restart the machine.
>>> The machine can't restart successfully, so I need to press the
>>> power button to shutdown.
>>> I tried  each of the following and the issue can't be triggered.
>>> 1. disable secure boot in BIOS.
>>> 2. intel_iommu=off.
>>> 3. intel_iomm=igfx_off.
>>> 4. nomodeset
>>> 5. i915.modeset=0.
>>>
>>> After I investigate further, find inte_iommu keeps checking the status
>>> of DMA_GSTS_TES.
>>> During the procedure of restart, the driver would disable iommu
>>> translation and
>>> check status of DMA_GSTS_TES until status of DMA_GSTS_TES is 0.
>>>
>>> If you need more information, I can provide it.
>>
>> Do you mind telling what platform is it?
>>
>> Best regards,
>> baolu
> Hi Baolu,
> Sorry, i missed your email.
> I'm running on TGL.
> My colleague has reported this on bugzilla.
> Have tested your patch and it works fine.
> https://bugzilla.kernel.org/show_bug.cgi?id=208363
> 
> Could you explain more about these patches!? Why do we need  a flag
> for active iommu!?
> 

We're still investigating this issue. If we find out more, I'll let you
know. Thanks a lot for the reporting.

Best regards,
baolu

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
