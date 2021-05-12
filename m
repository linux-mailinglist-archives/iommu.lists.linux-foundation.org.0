Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531737B51D
	for <lists.iommu@lfdr.de>; Wed, 12 May 2021 06:47:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DECAB4053D;
	Wed, 12 May 2021 04:47:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSHAo87SVBZe; Wed, 12 May 2021 04:47:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8B734052C;
	Wed, 12 May 2021 04:47:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87C9AC0001;
	Wed, 12 May 2021 04:47:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8710C0001
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 04:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E32460898
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 04:47:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2HUOc6Xe2nv for <iommu@lists.linux-foundation.org>;
 Wed, 12 May 2021 04:47:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDB5260724
 for <iommu@lists.linux-foundation.org>; Wed, 12 May 2021 04:47:43 +0000 (UTC)
IronPort-SDR: uWAhVfHtibOP2zAccjbI7Ghgt3EB2Gx59IZlz4ZLiIsdfUMMq6Xk85UxhrpwSasn8fFWNWmVXO
 SRXti6gzCimA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="197638960"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="197638960"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP; 11 May 2021 21:47:42 -0700
IronPort-SDR: 53J1wazrS1QReixwdHkkxnR6h55hKjKPB+/AHJbpqmNp4e/76VbGCJhC1SNjmVaypT58hu5x5h
 SX50P3VhkV8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,292,1613462400"; d="scan'208";a="622109218"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga006.fm.intel.com with ESMTP; 11 May 2021 20:21:05 -0700
Subject: Re: [RFC PATCH v4 01/13] iommu: Introduce dirty log tracking framework
To: Keqian Zhu <zhukeqian1@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Yi Sun <yi.y.sun@linux.intel.com>, Tian Kevin <kevin.tian@intel.com>
References: <20210507102211.8836-1-zhukeqian1@huawei.com>
 <20210507102211.8836-2-zhukeqian1@huawei.com>
 <efc2d868-28ba-8ed9-1d6b-610b67d671b5@linux.intel.com>
 <18ac787a-179e-71f7-728b-c43feda80a16@huawei.com>
 <55fda826-9ab6-a3a0-b17e-a4d4879f00bc@linux.intel.com>
 <a8df289a-47c2-c193-cd6f-8415f68b900f@huawei.com>
 <f47e90c6-f3c4-b28f-a810-e03afe79e62d@linux.intel.com>
 <60182a35-e151-7150-3708-4e58dd8e78da@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <36cc7267-6aa3-db54-b08c-c2dfc0bbacb6@linux.intel.com>
Date: Wed, 12 May 2021 11:20:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <60182a35-e151-7150-3708-4e58dd8e78da@huawei.com>
Content-Language: en-US
Cc: jiangkunkun@huawei.com, Cornelia Huck <cohuck@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, lushenming@huawei.com,
 Alex Williamson <alex.williamson@redhat.com>, wanghaibin.wang@huawei.com
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

On 5/11/21 3:40 PM, Keqian Zhu wrote:
>> For upper layers, before starting page tracking, they check the
>> dirty_page_trackable attribution of the domain and start it only it's
>> capable. Once the page tracking is switched on the vendor iommu driver
>> (or iommu core) should block further device attach/detach operations
>> until page tracking is stopped.
> But when a domain becomes capable after detaching a device, the upper layer
> still needs to query it and enable dirty log for it...
> 
> To make things coordinated, maybe the upper layer can register a notifier,
> when the domain's capability change, the upper layer do not need to query, instead
> they just need to realize a callback, and do their specific policy in the callback.
> What do you think?
> 

That might be an option. But why not checking domain's attribution every
time a new tracking period is about to start?

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
