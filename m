Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5341C19F
	for <lists.iommu@lfdr.de>; Wed, 29 Sep 2021 11:29:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2441819E6;
	Wed, 29 Sep 2021 09:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZjui57mhYHP; Wed, 29 Sep 2021 09:29:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0B50B825C6;
	Wed, 29 Sep 2021 09:29:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C59CAC0022;
	Wed, 29 Sep 2021 09:29:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7303FC000D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 09:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 604274039E
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 09:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8vMQYa_JXRk for <iommu@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 09:29:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 654A140012
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 09:29:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="247422880"
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; d="scan'208";a="247422880"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 02:29:25 -0700
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; d="scan'208";a="563138185"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.210.53])
 ([10.254.210.53])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 02:29:18 -0700
Subject: Re: [RFC 04/20] iommu: Add iommu_device_get_info interface
To: David Gibson <david@gibson.dropbear.id.au>, Liu Yi L <yi.l.liu@intel.com>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-5-yi.l.liu@intel.com> <YVPU89utk3JFPzS7@yekko>
 <21cd618b-3ea6-dc89-cc79-e0927dece927@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <ba0a7369-c115-2df5-e2bb-bd65ca20a0dc@linux.intel.com>
Date: Wed, 29 Sep 2021 17:29:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <21cd618b-3ea6-dc89-cc79-e0927dece927@linux.intel.com>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021/9/29 17:25, Lu Baolu wrote:
> Hi David,
> =

> On 2021/9/29 10:52, David Gibson wrote:
>> On Sun, Sep 19, 2021 at 02:38:32PM +0800, Liu Yi L wrote:
>>> From: Lu Baolu<baolu.lu@linux.intel.com>
>>>
>>> This provides an interface for upper layers to get the per-device iommu
>>> attributes.
>>>
>>> =A0=A0=A0=A0 int iommu_device_get_info(struct device *dev,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 enum iommu_devattr attr, void *data);
>> That fact that this interface doesn't let you know how to size the
>> data buffer, other than by just knowing the right size for each attr
>> concerns me.
>>
> =

> We plan to address this by following the comments here.
> =

> https://lore.kernel.org/linux-iommu/20210921161930.GP327412@nvidia.com/

And Christoph gave another option as well.

https://lore.kernel.org/linux-iommu/20210922050746.GA12921@lst.de/

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
