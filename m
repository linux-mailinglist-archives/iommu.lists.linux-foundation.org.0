Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 827AD2D101C
	for <lists.iommu@lfdr.de>; Mon,  7 Dec 2020 13:10:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 306F086018;
	Mon,  7 Dec 2020 12:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dkAOW--yrjcy; Mon,  7 Dec 2020 12:10:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C671087388;
	Mon,  7 Dec 2020 12:10:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA17AC013B;
	Mon,  7 Dec 2020 12:10:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8E70C013B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 12:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D694587820
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 12:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7-LhWrkU0Rw for <iommu@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 12:10:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 686338781E
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 12:10:13 +0000 (UTC)
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4CqMYR1xCjz13RDD;
 Mon,  7 Dec 2020 20:09:15 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Mon, 7 Dec 2020 20:10:06 +0800
Received: from [10.174.185.137] (10.174.185.137) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 7 Dec 2020 20:10:05 +0800
Subject: Re: [PATCH] iommu/io-pgtalbe-arm: Remove "iopte_type(pte, l)" extra
 parameter "l"
To: Will Deacon <will@kernel.org>
References: <20201207081404.1699-1-jiangkunkun@huawei.com>
 <20201207102458.GB3825@willie-the-truck>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <83f3f9f5-43d8-e02b-39e2-70edd42799a8@huawei.com>
Date: Mon, 7 Dec 2020 20:09:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207102458.GB3825@willie-the-truck>
Content-Language: en-US
X-Originating-IP: [10.174.185.137]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Cc: Keqian Zhu <zhukeqian1@huawei.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 wanghaibin.wang@huawei.com, Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
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

SGkgV2lsbCwKCk9uIDIwMjAvMTIvNyAxODoyNCwgV2lsbCBEZWFjb24gd3JvdGU6Cj4gT24gTW9u
LCBEZWMgMDcsIDIwMjAgYXQgMDQ6MTQ6MDRQTSArMDgwMCwgS3Vua3VuIEppYW5nIHdyb3RlOgo+
PiBLbm93aW5nIGZyb20gdGhlIGNvZGUsIHRoZSBtYWNybyAiaW9wdGVfdHlwZShwdGUsIGwpIiBk
b2Vzbid0IHVzZSB0aGUKPj4gcGFyYW1ldGVyICJsIiAobGV2ZWwpLiBTbyB3ZSdkIGJldHRlciB0
byByZW1vdmUgaXQuCj4+Cj4+IEZpeGVzOiBlMWQzYzBmZDcwMWRmKGlvbW11OiBhZGQgQVJNIExQ
QUUgcGFnZSB0YWJsZSBhbGxvY2F0b3IpCj4+IFNpZ25lZC1vZmYtYnk6IEt1bmt1biBKaWFuZyA8
amlhbmdrdW5rdW5AaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9pb21tdS9pby1wZ3Rh
YmxlLWFybS5jIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFy
bS5jIGIvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jCj4+IGluZGV4IGE3YTliYzA4ZGNk
MS4uOTI1YWUyYjcxM2Q2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2lvLXBndGFibGUt
YXJtLmMKPj4gKysrIGIvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jCj4+IEBAIC0xMzAs
NyArMTMwLDcgQEAKPj4gICAvKiBJT1BURSBhY2Nlc3NvcnMgKi8KPj4gICAjZGVmaW5lIGlvcHRl
X2RlcmVmKHB0ZSxkKSBfX3ZhKGlvcHRlX3RvX3BhZGRyKHB0ZSwgZCkpCj4+ICAgCj4+IC0jZGVm
aW5lIGlvcHRlX3R5cGUocHRlLGwpCQkJCQlcCj4+ICsjZGVmaW5lIGlvcHRlX3R5cGUocHRlKQkJ
CQkJXAo+PiAgIAkoKChwdGUpID4+IEFSTV9MUEFFX1BURV9UWVBFX1NISUZUKSAmIEFSTV9MUEFF
X1BURV9UWVBFX01BU0spCj4gU2hvdWxkbid0IHdlIHVwZGF0ZSBhbGwgdGhlIHVzZXJzIG9mIHRo
ZSBtYWNybyB0b28/Cj4KPiBXaWxsCj4gLgoKU29ycnkgZm9yIG15IGNhcmVsZXNzbmVzcy7CoCA6
KAoKSSBoYXZlIHJlc2VudCBpdC4KCgpUaGFua3MsCgpLdW5rdW4gSmlhbmcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdApp
b21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
