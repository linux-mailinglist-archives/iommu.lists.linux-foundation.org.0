Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BD641C194
	for <lists.iommu@lfdr.de>; Wed, 29 Sep 2021 11:25:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DEDF407F5;
	Wed, 29 Sep 2021 09:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMJMrkvMueVW; Wed, 29 Sep 2021 09:25:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4C7BF407C7;
	Wed, 29 Sep 2021 09:25:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2582CC0022;
	Wed, 29 Sep 2021 09:25:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5C0CC000D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 09:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6F8A407C7
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 09:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YvRbaINBYkTc for <iommu@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 09:25:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07BAF40799
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 09:25:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="224970416"
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; d="scan'208";a="224970416"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 02:25:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; d="scan'208";a="563136465"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.210.53])
 ([10.254.210.53])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 02:25:21 -0700
Subject: Re: [RFC 04/20] iommu: Add iommu_device_get_info interface
To: David Gibson <david@gibson.dropbear.id.au>, Liu Yi L <yi.l.liu@intel.com>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-5-yi.l.liu@intel.com> <YVPU89utk3JFPzS7@yekko>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <21cd618b-3ea6-dc89-cc79-e0927dece927@linux.intel.com>
Date: Wed, 29 Sep 2021 17:25:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVPU89utk3JFPzS7@yekko>
Content-Language: en-US
Cc: kvm@vger.kernel.org, jasowang@redhat.com, kwankhede@nvidia.com, hch@lst.de,
 jean-philippe@linaro.org, dave.jiang@intel.com, ashok.raj@intel.com,
 corbet@lwn.net, jgg@nvidia.com, kevin.tian@intel.com, parav@mellanox.com,
 alex.williamson@redhat.com, lkml@metux.net, dwmw2@infradead.org,
 jun.j.tian@intel.com, linux-kernel@vger.kernel.org, lushenming@huawei.com,
 iommu@lists.linux-foundation.org, pbonzini@redhat.com, robin.murphy@arm.com
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

Hi David,

On 2021/9/29 10:52, David Gibson wrote:
> On Sun, Sep 19, 2021 at 02:38:32PM +0800, Liu Yi L wrote:
>> From: Lu Baolu<baolu.lu@linux.intel.com>
>>
>> This provides an interface for upper layers to get the per-device iommu
>> attributes.
>>
>>      int iommu_device_get_info(struct device *dev,
>>                                enum iommu_devattr attr, void *data);
> That fact that this interface doesn't let you know how to size the
> data buffer, other than by just knowing the right size for each attr
> concerns me.
> 

We plan to address this by following the comments here.

https://lore.kernel.org/linux-iommu/20210921161930.GP327412@nvidia.com/

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
