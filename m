Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46733FD8B
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 04:07:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49A14ED31;
	Thu, 18 Mar 2021 03:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_QTwFwrC2N3; Thu, 18 Mar 2021 03:07:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E76644731;
	Thu, 18 Mar 2021 03:07:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DEB6C0011;
	Thu, 18 Mar 2021 03:07:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95793C0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 03:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C33884070
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 03:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JjaYoI4a_TEE for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 03:07:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECF3784065
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 03:07:46 +0000 (UTC)
IronPort-SDR: 5reAWQ9AxLD4/s6fnPFP7FTJXeWWp7ff/FB5bj+NGVDlAVZmmPIP1LzJ7EBWHfi6jOGTIn6Lew
 XPsfPmT868MQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="209580986"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="209580986"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 20:07:45 -0700
IronPort-SDR: To81mTiyNzacaGr5ZeEbxfATpWia2tmPKB2sFuzkB9r9yHyKe+V7SxCkeKvoOXKX4lQ4qQgQOP
 JadvHCF0TF7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="433651877"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2021 20:07:43 -0700
Subject: =?UTF-8?Q?Re=3a_A_problem_of_Intel_IOMMU_hardware_=ef=bc=9f?=
To: Alex Williamson <alex.williamson@redhat.com>
References: <670baaf8-4ff8-4e84-4be3-030b95ab5a5e@huawei.com>
 <692186fd-42b8-4054-ead2-f6c6b1bf5b2d@linux.intel.com>
 <20210317091820.5f4ab69e@omen.home.shazbot.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <87a5f90a-d1ea-fe7a-2577-fdfdf25f8fd7@linux.intel.com>
Date: Thu, 18 Mar 2021 10:58:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210317091820.5f4ab69e@omen.home.shazbot.org>
Content-Language: en-US
Cc: chenjiashang@huawei.com, dwmw2@infradead.org,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>,
 will@kernel.org
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

Hi Alex,

On 3/17/21 11:18 PM, Alex Williamson wrote:
>>>           {MAP,   0x0, 0xc0000000}, --------------------------------- (b)
>>>                   use GDB to pause at here, and then DMA read IOVA=0,
>> IOVA 0 seems to be a special one. Have you verified with other addresses
>> than IOVA 0?
> It is???  That would be a problem.
> 

No problem from hardware point of view as far as I can see. Just
thought about software might handle it specially.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
