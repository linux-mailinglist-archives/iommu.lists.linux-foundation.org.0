Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFBC173416
	for <lists.iommu@lfdr.de>; Fri, 28 Feb 2020 10:33:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A1B1880CC;
	Fri, 28 Feb 2020 09:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vktXl0QjnRiu; Fri, 28 Feb 2020 09:33:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 949DB880CB;
	Fri, 28 Feb 2020 09:33:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8391BC0177;
	Fri, 28 Feb 2020 09:33:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01430C0177
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 09:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E7D5586AD9
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 09:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6eZZ8oE7KYN3 for <iommu@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 09:33:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9D51886B67
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 09:33:46 +0000 (UTC)
Received: from lhreml702-cah.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id B9CAD6B13B3A521ED142;
 Fri, 28 Feb 2020 09:33:42 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml702-cah.china.huawei.com (10.201.108.43) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 28 Feb 2020 09:33:42 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Fri, 28 Feb
 2020 09:33:41 +0000
Subject: Re: [PATCH] iommu: silence iommu group prints
To: Lu Baolu <baolu.lu@linux.intel.com>, Russell King
 <rmk+kernel@armlinux.org.uk>, Joerg Roedel <joro@8bytes.org>
References: <E1j7Hnc-0004Bm-Kn@rmk-PC.armlinux.org.uk>
 <f0fc4c8c-4475-e77f-da6d-e068e7993568@linux.intel.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <b4029a97-ac80-484f-9d01-d7f4eb174cdd@huawei.com>
Date: Fri, 28 Feb 2020 09:33:40 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <f0fc4c8c-4475-e77f-da6d-e068e7993568@linux.intel.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml708-chm.china.huawei.com (10.201.108.57) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org
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

T24gMjgvMDIvMjAyMCAwMjoxNiwgTHUgQmFvbHUgd3JvdGU6Cj4gSGksCj4gCj4gT24gMjAyMC8y
LzI3IDE5OjU3LCBSdXNzZWxsIEtpbmcgd3JvdGU6Cj4+IE9uIHRoZSBMWDIxNjBBLCB0aGVyZSBh
cmUgbG90cyAoYWJvdXQgMTYwKSBvZiBJT01NVSBtZXNzYWdlcyBwcm9kdWNlZAo+PiBkdXJpbmcg
Ym9vdDsgdGhpcyBpcyBleGNlc3NpdmUuwqAgUmVkdWNlIHRoZSBzZXZlcml0eSBvZiB0aGVzZSBt
ZXNzYWdlcwo+PiB0byBkZWJ1ZyBsZXZlbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBL
aW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvaW9t
bXUvaW9tbXUuYyB8IDQgKystLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9pb21tdS5j
IGIvZHJpdmVycy9pb21tdS9pb21tdS5jCj4+IGluZGV4IDNlYWQ1OTdlMWM1Ny4uMzA0MjgxZWM2
MjNiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2lvbW11LmMKPj4gKysrIGIvZHJpdmVy
cy9pb21tdS9pb21tdS5jCj4+IEBAIC03NDEsNyArNzQxLDcgQEAgaW50IGlvbW11X2dyb3VwX2Fk
ZF9kZXZpY2Uoc3RydWN0IGlvbW11X2dyb3VwIAo+PiAqZ3JvdXAsIHN0cnVjdCBkZXZpY2UgKmRl
dikKPj4gwqDCoMKgwqDCoCB0cmFjZV9hZGRfZGV2aWNlX3RvX2dyb3VwKGdyb3VwLT5pZCwgZGV2
KTsKPj4gLcKgwqDCoCBkZXZfaW5mbyhkZXYsICJBZGRpbmcgdG8gaW9tbXUgZ3JvdXAgJWRcbiIs
IGdyb3VwLT5pZCk7Cj4+ICvCoMKgwqAgZGV2X2RiZyhkZXYsICJBZGRpbmcgdG8gaW9tbXUgZ3Jv
dXAgJWRcbiIsIGdyb3VwLT5pZCk7Cj4gCj4gSSdtIG5vdCBzdHJvbmdseSBhZ2FpbnN0IHRoaXMu
IEJ1dCB0byBtZSB0aGlzIG1lc3NhZ2Ugc2VlbXMgdG8gYmUgYSBnb29kCj4gaW5kaWNhdG9yIHRo
YXQgYSBkZXZpY2Ugd2FzIHByb2JlZCBzdWNjZXNzZnVsbHkgYnkgdGhlIGlvbW11IHN1YnN5c3Rl
bS4KPiBLZWVwaW5nIGl0IGluIHRoZSBkZWZhdWx0IGtlcm5lbCBtZXNzYWdlIGFsd2F5cyBoZWxw
cyB0byB0aGUga2VybmVsCj4gZGVidWdnaW5nLgo+IAoKSSB3b3VsZCB0ZW5kIHRvIGFncmVlLgoK
PiBCZXN0IHJlZ2FyZHMsCj4gYmFvbHUKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGlvbW11IG1haWxpbmcgbGlzdAo+IGlvbW11QGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCj4gaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vaW9tbXUKPiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW9tbXU=
