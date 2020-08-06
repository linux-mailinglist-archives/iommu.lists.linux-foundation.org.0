Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E4023D589
	for <lists.iommu@lfdr.de>; Thu,  6 Aug 2020 04:41:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 77F5688836;
	Thu,  6 Aug 2020 02:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJPIV7X8nYUg; Thu,  6 Aug 2020 02:41:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B9E0E88770;
	Thu,  6 Aug 2020 02:41:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4E72C004C;
	Thu,  6 Aug 2020 02:41:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43A44C004C
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 02:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 37A2E88198
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 02:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9jTwsQHJBJl for <iommu@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 02:41:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 898E48817F
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 02:41:05 +0000 (UTC)
IronPort-SDR: pIuTk0NqlRxA4DDWYPl+h+iwAI5qm/+IUI/Qr09NrbT/mreVMob/sU587l7ncn24leWWIlZmxR
 JSePOcTgzY9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="170781930"
X-IronPort-AV: E=Sophos;i="5.75,440,1589266800"; d="scan'208";a="170781930"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 19:41:04 -0700
IronPort-SDR: 01z1oTvHs236teqMmA01Epi/XmFNPcF8IQ33M0LLSLbhaOyWO2Oj9W7sHHgOJQRWRp6m/M79fz
 XI2g/oYpLb8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,440,1589266800"; d="scan'208";a="397112923"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2020 19:41:02 -0700
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiDnrZTlpI06IOetlOWkjTog562U5aSN?=
 =?UTF-8?Q?=3a_=5bPATCH=5d_iommu/vt-d=3aAdd_support_for_ACPI_device_in_RMRR?=
To: FelixCui-oc <FelixCui-oc@zhaoxin.com>, Joerg Roedel <joro@8bytes.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <20200802100735.2722-1-FelixCui-oc@zhaoxin.com>
 <73d4a1e4-f6b7-efb0-e225-2e462c838657@linux.intel.com>
 <f6759b9bb2594026b58f9a89e3ce9dc6@zhaoxin.com>
 <9f64d9b6-16e8-73ce-2186-9d8ba49c39f4@linux.intel.com>
 <44ff8f73fa1f49a183a1d8d6d9c2213c@zhaoxin.com>
 <314679b4-7653-041b-9310-73baf8117766@linux.intel.com>
 <1aea042a1b524ef88e491ca2a6d95fb7@zhaoxin.com>
 <36da53a6-00e2-1be1-91b5-d90906a6199f@linux.intel.com>
 <a5fda3f364da4e739736e7d7bc618972@zhaoxin.com>
 <a2658f9c-23fa-bb72-edba-ad61e52085cd@linux.intel.com>
 <9ba29114fcad43d58159fcc7a4d89501@zhaoxin.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <1477b1dd-ac48-b49d-77f9-107bb4555b91@linux.intel.com>
Date: Thu, 6 Aug 2020 10:36:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9ba29114fcad43d58159fcc7a4d89501@zhaoxin.com>
Content-Language: en-US
Cc: CobeChen-oc <CobeChen-oc@zhaoxin.com>
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

Hi Felix,

On 8/5/20 3:37 PM, FelixCui-oc wrote:
> Hi baolu,
> 		Let me talk about why acpi_device_create_direct_mappings() is needed and please tell me if there is an error.

Sure. Before that, let me sync my understanding with you. You have an
acpi namespace device in ANDD table, it also shows up in the device
scope of a RMRR. Current code doesn't enumerate that device for the
RMRR, hence iommu_create_device_direct_mappings() doesn't work for this
device.

At the same time, probe_acpi_namespace_devices() doesn't work for this
device, hence you want to add a home-made
acpi_device_create_direct_mappings() helper.

Did I get it right?

> 		In the probe_acpi_namespace_devices() function, only the device in the addev->physical_node_list is probed,
> 		but we need to establish identity mapping for the namespace device in RMRR. These are two different devices.

The namespace device has been probed and put in one drhd's device list.
Hence, it should be processed by probe_acpi_namespace_devices(). So the
question is why there are no devices in addev->physical_node_list?

> 		Therefore, the namespace device in RMRR is not mapped in probe_acpi_namespace_devices().
> 		acpi_device_create_direct_mappings() is to create direct mappings for namespace devices in RMRR.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
