Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 090D712A07A
	for <lists.iommu@lfdr.de>; Tue, 24 Dec 2019 12:27:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A73C5856CB;
	Tue, 24 Dec 2019 11:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VpdC-YS5gcki; Tue, 24 Dec 2019 11:26:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C98EA85722;
	Tue, 24 Dec 2019 11:26:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B407EC0881;
	Tue, 24 Dec 2019 11:26:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0F9EC0881
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 11:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ACDED87482
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 11:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVpqGXKK6h6L for <iommu@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 11:26:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 26D718742F
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 11:26:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Dec 2019 03:26:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,351,1571727600"; d="scan'208";a="207573299"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.215.56])
 ([10.254.215.56])
 by orsmga007.jf.intel.com with ESMTP; 24 Dec 2019 03:26:53 -0800
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW9tbXUv?=
 =?UTF-8?Q?vt-d=3a_Don=27t_reject_nvme_host_due_to_scope_mismatch?=
To: "Jim,Yan" <jimyan@baidu.com>, Jerry Snitselaar <jsnitsel@redhat.com>
References: <4b77511069cb4fbc982eebaad941cd23@baidu.com>
 <149a454d-96ea-1e25-74d1-04a08f8b261e@linux.intel.com>
 <8fbd6988b0a94c5e9e4b23eed59114dc@baidu.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <273a4cc4-f17b-63a6-177d-9830e683bf52@linux.intel.com>
Date: Tue, 24 Dec 2019 19:26:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <8fbd6988b0a94c5e9e4b23eed59114dc@baidu.com>
Content-Language: en-US
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi,

On 2019/12/24 16:18, Jim,Yan wrote:
>>>> For both cases, a quirk flag seems to be more reasonable, so that
>>>> unrelated devices will not be impacted.
>>>>
>>>> Best regards,
>>>> baolu
>>> Hi Baolu,
>>> 	Thanks for your advice. And I modify the patch as follow.
>> I just posted a patch for both NTG and NVME cases. Can you please take a look?
>> Does it work for you?
>>
>> Best regards,
>> baolu
>>
> I have tested your patch. It does work for me. But I prefer my second version, it is more flexible, and may use for similar unknown devices.
> 

I didn't get your point. Do you mind explaining why it's more flexible?

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
