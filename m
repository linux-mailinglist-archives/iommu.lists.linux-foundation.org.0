Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EEF35253F
	for <lists.iommu@lfdr.de>; Fri,  2 Apr 2021 03:45:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF53B4191A;
	Fri,  2 Apr 2021 01:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jNHrxHGM1H-X; Fri,  2 Apr 2021 01:45:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FA3241919;
	Fri,  2 Apr 2021 01:45:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 811B1C0011;
	Fri,  2 Apr 2021 01:45:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5C81C000A
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 01:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB9AD4191A
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 01:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h7vVw54NYBjO for <iommu@lists.linux-foundation.org>;
 Fri,  2 Apr 2021 01:45:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06BAF41919
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 01:45:15 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FBN9P0psmz1BFlH;
 Fri,  2 Apr 2021 09:43:05 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.87) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 2 Apr 2021
 09:45:02 +0800
Subject: Re: [PATCH v14 10/10] iommu/arm-smmu-v3: Add stall support for
 platform devices
To: Will Deacon <will@kernel.org>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>
References: <20210401154718.307519-1-jean-philippe@linaro.org>
 <20210401154718.307519-11-jean-philippe@linaro.org>
 <20210401171101.GB9447@willie-the-truck>
From: Zhou Wang <wangzhou1@hisilicon.com>
Message-ID: <8e55e807-69f2-6492-e4a0-0dd9250142bc@hisilicon.com>
Date: Fri, 2 Apr 2021 09:45:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210401171101.GB9447@willie-the-truck>
X-Originating-IP: [10.40.188.87]
X-CFilter-Loop: Reflected
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, vivek.gautam@arm.com,
 guohanjun@huawei.com, rjw@rjwysocki.net, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com,
 zhangfei.gao@linaro.org, robin.murphy@arm.com,
 linux-accelerators@lists.ozlabs.org, lenb@kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gMjAyMS80LzIgMToxMSwgV2lsbCBEZWFjb24gd3JvdGU6Cj4gT24gVGh1LCBBcHIgMDEsIDIw
MjEgYXQgMDU6NDc6MTlQTSArMDIwMCwgSmVhbi1QaGlsaXBwZSBCcnVja2VyIHdyb3RlOgo+PiBU
aGUgU01NVSBwcm92aWRlcyBhIFN0YWxsIG1vZGVsIGZvciBoYW5kbGluZyBwYWdlIGZhdWx0cyBp
biBwbGF0Zm9ybQo+PiBkZXZpY2VzLiBJdCBpcyBzaW1pbGFyIHRvIFBDSWUgUFJJLCBidXQgZG9l
c24ndCByZXF1aXJlIGRldmljZXMgdG8gaGF2ZQo+PiB0aGVpciBvd24gdHJhbnNsYXRpb24gY2Fj
aGUuIEluc3RlYWQsIGZhdWx0aW5nIHRyYW5zYWN0aW9ucyBhcmUgcGFya2VkCj4+IGFuZCB0aGUg
T1MgaXMgZ2l2ZW4gYSBjaGFuY2UgdG8gZml4IHRoZSBwYWdlIHRhYmxlcyBhbmQgcmV0cnkgdGhl
Cj4+IHRyYW5zYWN0aW9uLgo+Pgo+PiBFbmFibGUgc3RhbGwgZm9yIGRldmljZXMgdGhhdCBzdXBw
b3J0IGl0IChvcHQtaW4gYnkgZmlybXdhcmUpLiBXaGVuIGFuCj4+IGV2ZW50IGNvcnJlc3BvbmRz
IHRvIGEgdHJhbnNsYXRpb24gZXJyb3IsIGNhbGwgdGhlIElPTU1VIGZhdWx0IGhhbmRsZXIuCj4+
IElmIHRoZSBmYXVsdCBpcyByZWNvdmVyYWJsZSwgaXQgd2lsbCBjYWxsIHVzIGJhY2sgdG8gdGVy
bWluYXRlIG9yCj4+IGNvbnRpbnVlIHRoZSBzdGFsbC4KPiAKPiBXaGljaCBoYXJkd2FyZSBpcyB0
aGlzIHVzZWZ1bCBmb3I/IFN0YWxsaW5nIGFkZHMgYSBmYWlyIGFtb3VudCBvZiBjb21wbGV4aXR5
Cj4gdG8gdGhlIGRyaXZlciwgc28gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgc3VwcG9ydCBpdCB1
bmxlc3Mgd2UncmUgbGlrZWx5IHRvCj4gc2VlIHBsYXRmb3JtcyB0aGF0IGJvdGggaW1wbGVtZW50
IGl0IGFuZCBkbyBzb21ldGhpbmcgdXNlZnVsIHdpdGggaXQuCgpIaSBXaWxs77yMCgpIaVNpbGlj
b24gS3VucGVuZzkyMCdzIFpJUC9TRUMvSFBSRSBlbmdpbmVzKGRyaXZlcnMvY3J5cHRvL2hpc2ls
aWNvbi8pIGFyZSB1c2luZwpzdGFsbCBtb2RlLgoKVUFDQ0UgZHJpdmVyKGRyaXZlcnMvbWlzYy91
YWNjZS8pIGlzIHVzZWQgdG8gZXhwb3J0IHRoZXNlIGVuZ2luZXMgdG8gdXNlciBzcGFjZS4KQSB1
c2VyIHNwYWNlIGxpYnJhcnk6IGh0dHBzOi8vZ2l0aHViLmNvbS9MaW5hcm8vdWFkayBvZmZlcnMg
QVBJcyB0byBoZWxwIHVzZXJzCnRvIHVzZSB0aGVzZSBlbmdpbmVzLgoKSW4gZmFjdCwgd2Ugb25s
eSBuZWVkIGEgcXVpcmsoaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjEvMy84LzE1MDYpIGJhc2Vk
IG9uIHRoaXMKSU9QRiBzZXJpZXMgdG8gbWFrZSB3aG9sZSBzb2x1dGlvbiBtYWlubGluZSByZWFk
eS4gU28gcGxlYXNlIGFsc28gdGFrZSB0aGlzCnBhdGNoLCB3ZSBuZWVkIGl0ISA6KQoKQmVzdCwK
WmhvdQoKPiAKPiBXaWxsCj4gCj4gLgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lvbW11
