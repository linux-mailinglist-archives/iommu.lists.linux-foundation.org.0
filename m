Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F13A5E1C
	for <lists.iommu@lfdr.de>; Mon, 14 Jun 2021 10:09:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE6283A83;
	Mon, 14 Jun 2021 08:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZsGawRkS7Ki; Mon, 14 Jun 2021 08:09:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B3A3983A77;
	Mon, 14 Jun 2021 08:09:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82A2AC0024;
	Mon, 14 Jun 2021 08:09:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1AF3C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 08:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE90B60642
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 08:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wM-mOOBjT-rI for <iommu@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 08:09:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA0966059E
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 08:09:49 +0000 (UTC)
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G3P0s5vvHz6H7n1;
 Mon, 14 Jun 2021 15:56:45 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 14 Jun 2021 10:09:46 +0200
Received: from [10.47.95.26] (10.47.95.26) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 14 Jun
 2021 09:09:46 +0100
Subject: Re: [PATCH v12 3/5] iommu/vt-d: Add support for IOMMU default DMA
 mode build options
To: Lu Baolu <baolu.lu@linux.intel.com>, <joro@8bytes.org>, <will@kernel.org>, 
 <dwmw2@infradead.org>, <robin.murphy@arm.com>
References: <1623414043-40745-1-git-send-email-john.garry@huawei.com>
 <1623414043-40745-4-git-send-email-john.garry@huawei.com>
 <f3940a3f-d1c1-148d-e4b5-51cecf924ff5@linux.intel.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <03675e2f-c3a6-ce33-ef96-f9ae544b2d13@huawei.com>
Date: Mon, 14 Jun 2021 09:03:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <f3940a3f-d1c1-148d-e4b5-51cecf924ff5@linux.intel.com>
Content-Language: en-US
X-Originating-IP: [10.47.95.26]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gMTIvMDYvMjAyMSAwMzoxNCwgTHUgQmFvbHUgd3JvdGU6Cj4gT24gMjAyMS82LzExIDIwOjIw
LCBKb2huIEdhcnJ5IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9LY29uZmln
IGIvZHJpdmVycy9pb21tdS9LY29uZmlnCj4+IGluZGV4IDJhNzEzNDc2MTFkNC4uNDQ2NzM1M2Y5
ODFiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2lvbW11L0tjb25maWcKPj4gKysrIGIvZHJpdmVy
cy9pb21tdS9LY29uZmlnCj4+IEBAIC05NCw2ICs5NCw3IEBAIGNob2ljZQo+PiDCoMKgwqDCoMKg
IHByb21wdCAiSU9NTVUgZGVmYXVsdCBETUEgbW9kZSIKPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9u
IElPTU1VX0RNQQo+PiArwqDCoMKgIGRlZmF1bHQgSU9NTVVfREVGQVVMVF9MQVpZIGlmIElOVEVM
X0lPTU1VCj4+IMKgwqDCoMKgwqAgZGVmYXVsdCBJT01NVV9ERUZBVUxUX1NUUklDVAo+IAo+IElm
IHR3byBkZWZhdWx0IHZhbHVlcyBhcmUgZGlmZmVyZW50LiBXaGljaCBvbmUgd2lsbCBiZSBvdmVy
cmlkZGVuPwoKSWYgSSB1bmRlcnN0YW5kIHlvdXIgcXVlc3Rpb24gY29ycmVjdGx5LCBJIHRoaW5r
IHlvdSBhcmUgYXNraW5nIGlmIGJvdGggCmFyZSBzZXQ6CkNPTkZJR19JT01NVV9ERUZBVUxUX0xB
Wlk9eQpDT05GSUdfSU9NTVVfREVGQVVMVF9TVFJJQ1Q9eQoKSWYgdGhpcyBoYXBwZW5zLCB0aGVu
IG1ha2UgZGVmY29uZmlnIGNvbXBsYWlucyBhYm91dCBib3RoIGJlaW5nIHNldCwgYW5kIApzZWxl
Y3RzIHRoZSAybmQsIHdoYXRldmVyIHRoYXQgaXMuCgpJZiBuZWl0aGVyIGFyZSBzZXQsIHRoZW4g
SU9NTVVfREVGQVVMVF9MQVpZIGlzIHNldCBpZiBJTlRFTF9JT01NVSBpcyAKc2V0LCBvdGhlcndp
c2UgSU9NTVVfREVGQVVMVF9TVFJJQ1QuCgpUaGFua3MsCkpvaG4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
