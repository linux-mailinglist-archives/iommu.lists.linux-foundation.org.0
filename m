Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F842460FF4
	for <lists.iommu@lfdr.de>; Mon, 29 Nov 2021 09:22:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18B7E408FB;
	Mon, 29 Nov 2021 08:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4CVYaEKMiNB; Mon, 29 Nov 2021 08:22:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0EFFF40916;
	Mon, 29 Nov 2021 08:22:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3475C003C;
	Mon, 29 Nov 2021 08:22:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32F71C000A
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 08:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13AB581D70
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 08:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7r74zz7MfPSE for <iommu@lists.linux-foundation.org>;
 Mon, 29 Nov 2021 08:22:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C7AE81CE9
 for <iommu@lists.linux-foundation.org>; Mon, 29 Nov 2021 08:22:32 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J2dYt5T7tzZdKc;
 Mon, 29 Nov 2021 16:19:46 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 29 Nov 2021 16:22:25 +0800
Subject: Re: [PATCH v2 2/6] hwtracing: Add trace function support for
 HiSilicon PCIe Tune and Trace device
To: Robin Murphy <robin.murphy@arm.com>, <gregkh@linuxfoundation.org>,
 <helgaas@kernel.org>, <alexander.shishkin@linux.intel.com>,
 <lorenzo.pieralisi@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
 <mathieu.poirier@linaro.org>, <suzuki.poulose@arm.com>,
 <mike.leach@linaro.org>, <leo.yan@linaro.org>, <jonathan.cameron@huawei.com>, 
 <daniel.thompson@linaro.org>, <joro@8bytes.org>, <john.garry@huawei.com>,
 <shameerali.kolothum.thodi@huawei.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
 <linux-pci@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>
References: <20211116090625.53702-1-yangyicong@hisilicon.com>
 <20211116090625.53702-3-yangyicong@hisilicon.com>
 <0b67745c-13dd-1fea-1b8b-d55212bad232@arm.com>
 <3644ad6e-d800-c84b-9d62-6dda8462450f@hisilicon.com>
 <e7d4afb7-e4e4-e581-872b-2477850ad8da@hisilicon.com>
 <38bfa372-54c8-2e81-adab-ca24051a0fe6@arm.com>
Message-ID: <288856a6-d1eb-d4cc-f3ca-0134b7e4d1dc@hisilicon.com>
Date: Mon, 29 Nov 2021 16:22:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <38bfa372-54c8-2e81-adab-ca24051a0fe6@arm.com>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Cc: zhangshaokun@hisilicon.com, liuqi115@huawei.com, linuxarm@huawei.com,
 prime.zeng@huawei.com, yangyicong@hisilicon.com
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
From: Yicong Yang via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yicong Yang <yangyicong@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gMjAyMS8xMS8yNSAyMzo0OSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMjEtMTEtMTgg
MDk6MDEsIFlpY29uZyBZYW5nIHZpYSBpb21tdSB3cm90ZToKPj4gSGkgUm9iaW4sCj4+Cj4+IE9u
IDIwMjEvMTEvMTYgMTk6MzcsIFlpY29uZyBZYW5nIHdyb3RlOgo+Pj4gT24gMjAyMS8xMS8xNiAx
ODo1NiwgUm9iaW4gTXVycGh5IHdyb3RlOgo+Pj4+IE9uIDIwMjEtMTEtMTYgMDk6MDYsIFlpY29u
ZyBZYW5nIHZpYSBpb21tdSB3cm90ZToKPj4+PiBbLi4uXQo+Pj4+PiArLyoKPj4+Pj4gKyAqIEdl
dCBSTVIgYWRkcmVzcyBpZiBwcm92aWRlZCBieSB0aGUgZmlybXdhcmUuCj4+Pj4+ICsgKiBSZXR1
cm4gMCBpZiB0aGUgSU9NTVUgZG9lc24ndCBwcmVzZW50IG9yIHRoZSBwb2xpY3kgb2YgdGhlCj4+
Pj4+ICsgKiBJT01NVSBkb21haW4gaXMgcGFzc3Rocm91Z2ggb3Igd2UgZ2V0IGEgdXNhYmxlIFJN
UiByZWdpb24uCj4+Pj4+ICsgKiBPdGhlcndpc2UgYSBuZWdhdGl2ZSB2YWx1ZSBpcyByZXR1cm5l
ZC4KPj4+Pj4gKyAqLwo+Pj4+PiArc3RhdGljIGludCBoaXNpX3B0dF9nZXRfcm1yKHN0cnVjdCBo
aXNpX3B0dCAqaGlzaV9wdHQpCj4+Pj4+ICt7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IHBjaV9kZXYg
KnBkZXYgPSBoaXNpX3B0dC0+cGRldjsKPj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgaW9tbXVfZG9tYWlu
ICppb21tdV9kb21haW47Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IGlvbW11X3Jlc3ZfcmVnaW9uICpy
ZWdpb247Cj4+Pj4+ICvCoMKgwqAgTElTVF9IRUFEKGxpc3QpOwo+Pj4+PiArCj4+Pj4+ICvCoMKg
wqAgLyoKPj4+Pj4gK8KgwqDCoMKgICogVXNlIGRpcmVjdCBETUEgaWYgSU9NTVUgZG9lcyBub3Qg
cHJlc2VudCBvciB0aGUgcG9saWN5IG9mIHRoZQo+Pj4+PiArwqDCoMKgwqAgKiBJT01NVSBkb21h
aW4gaXMgcGFzc3Rocm91Z2guCj4+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+PiArwqDCoMKgIGlvbW11
X2RvbWFpbiA9IGlvbW11X2dldF9kb21haW5fZm9yX2RldigmcGRldi0+ZGV2KTsKPj4+Pj4gK8Kg
wqDCoCBpZiAoIWlvbW11X2RvbWFpbiB8fCBpb21tdV9kb21haW4tPnR5cGUgPT0gSU9NTVVfRE9N
QUlOX0lERU5USVRZKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4+ICsKPj4+
Pj4gK8KgwqDCoCBpb21tdV9nZXRfcmVzdl9yZWdpb25zKCZwZGV2LT5kZXYsICZsaXN0KTsKPj4+
Pj4gK8KgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KHJlZ2lvbiwgJmxpc3QsIGxpc3QpCj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAocmVnaW9uLT50eXBlID09IElPTU1VX1JFU1ZfRElSRUNUICYm
Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZ2lvbi0+bGVuZ3RoID49IEhJU0lfUFRU
X1RSQUNFX0JVRkZFUl9TSVpFKSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhpc2lf
cHR0LT50cmFjZV9jdHJsLmhhc19ybXIgPSB0cnVlOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBoaXNpX3B0dC0+dHJhY2VfY3RybC5ybXJfYWRkciA9IHJlZ2lvbi0+c3RhcnQ7Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhpc2lfcHR0LT50cmFjZV9jdHJsLnJtcl9sZW5ndGgg
PSByZWdpb24tPmxlbmd0aDsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBpb21tdV9wdXRfcmVz
dl9yZWdpb25zKCZwZGV2LT5kZXYsICZsaXN0KTsKPj4+Pj4gK8KgwqDCoCByZXR1cm4gaGlzaV9w
dHQtPnRyYWNlX2N0cmwuaGFzX3JtciA/IDAgOiAtRU5PTUVNOwo+Pj4+PiArfQo+Pj4+Cj4+Pj4g
Tm8uCj4+Pj4KPj4+PiBUaGUgd2hvbGUgcG9pbnQgb2YgUk1ScyBpcyBmb3IgZGV2aWNlcyB0aGF0
IGFyZSBhbHJlYWR5IGNvbmZpZ3VyZWQgdG8gYWNjZXNzIHRoZSBnaXZlbiBhZGRyZXNzIHJhbmdl
IGluIGEgbWFubmVyIGJleW9uZCB0aGUga2VybmVsJ3MgY29udHJvbC4gSWYgeW91IGNhbiBkbyB0
aGlzLCBpdCBwcm92ZXMgdGhhdCB5b3Ugc2hvdWxkIG5vdCBoYXZlIGFuIFJNUiBpbiB0aGUgZmly
c3QgcGxhY2UuCj4+Pj4KPj4+PiBUaGUgbm90aW9uIG9mIGEga2VybmVsIGRyaXZlciBleHBsaWNp
dGx5IGNvbmZpZ3VyaW5nIGl0cyBkZXZpY2UgdG8gRE1BIGludG8gYW55IHJhbmRvbSBSTVIgdGhh
dCBsb29rcyBiaWcgZW5vdWdoIGlzIHNvIGVncmVnaW91c2x5IHdyb25nIHRoYXQgSSdtIGFsbW9z
dCBsb3N0IGZvciB3b3Jkcy4uLgo+Pj4+Cj4+Pgo+Pj4gb3VyIGJpb3Mgd2lsbCByZXNlcnZlIHN1
Y2ggYSByZWdpb24gYW5kIHJlcG9ydGVkIGl0IHRocm91Z2ggaW9ydC4gdGhlIGRldmljZSB3aWxs
IHdyaXRlIHRvIHRoZSByZWdpb24gYW5kIGluIHRoZSBkcml2ZXIgd2UgbmVlZCB0byBhY2Nlc3Mg
dGhlIHJlZ2lvbgo+Pj4gdG8gZ2V0IHRoZSB0cmFjZWQgZGF0YS4gdGhlIHJlZ2lvbiBpcyByZXNl
cnZlZCBleGNsdXNpdmVseSBhbmQgd2lsbCBub3QgYmUgYWNjZXNzZWQgYnkga2VybmVsIG9yIG90
aGVyIGRldmljZXMuCj4+Pgo+Pj4gaXMgaXQgb2sgdG8gbGV0IGJpb3MgY29uZmlndXJlIHRoZSBh
ZGRyZXNzIHRvIHRoZSBkZXZpY2UgYW5kIGZyb20gQ1BVIHNpZGUgd2UganVzdCByZWFkIGl0Pwo+
Pj4KPj4KPj4gQW55IHN1Z2dlc3Rpb24/wqAgSXMgdGhpcyBzdGlsbCBhbiBpc3N1ZSB5b3UgY29u
Y2VybiBpZiB3ZSBtb3ZlIHRoZSBjb25maWd1cmF0aW9uIG9mIHRoZSBkZXZpY2UgYWRkcmVzcyB0
byBCSU9TIGFuZCBqdXN0IHJlYWQgZnJvbSB0aGUgQ1BVIHNpZGU/Cj4gCj4gSWYgdGhlIGZpcm13
YXJlIGNvbmZpZ3VyZXMgdGhlIGRldmljZSBzbyB0aGF0IGl0J3MgYWN0aXZlbHkgdHJhY2luZyBh
bmQgd3JpdGluZyBvdXQgdG8gbWVtb3J5IHdoaWxlIHRoZSBrZXJuZWwgYm9vdHMsIHRoZW4gdGhh
dCBpcyBhIHZhbGlkIHJlYXNvbiB0byBoYXZlIGFuIFJNUi4gSG93ZXZlciB3aGF0IHlvdSdyZSBk
b2luZyBpbiB0aGUgZHJpdmVyIGlzIHN0aWxsIGNvbXBsZXRlIG5vbnNlbnNlLiBBcyBmYXIgYXMg
SSBjYW4gZm9sbG93LCB0aGUgd2F5IGl0J3Mgd29ya2luZyBpcyB0aGlzOgo+IAo+IC0gQXQgcHJv
YmUgdGltZSwgdGhlIGluaXRpYWwgc3RhdGUgb2YgdGhlIGhhcmR3YXJlIGlzIGVudGlyZWx5IGln
bm9yZWQuIElmIGl0ICppcyogYWxyZWFkeSBhY3RpdmUsIHRoZXJlIGFwcGVhcnMgdG8gYmUgYSBm
dW4gY2hhbmNlIG9mIGNyYXNoaW5nIGlmIFRSQUNFX0lOVF9NQVNLIGlzIGNsZWFyIGFuZCBhbiBp
bnRlcnJ1cHQgaGFwcGVucyB0byBmaXJlIGJlZm9yZSBhbnlvbmUgaGFzIGdvdCByb3VuZCB0byBj
YWxsaW5nIHBlcmZfYXV4X291dHB1dF9iZWdpbigpIHRvIG1ha2UgdHJhY2VfY3RybC5oYW5kbGUu
cmIgbm9uLU5VTEwuCj4gCj4gLSBMYXRlciwgb25jZSB0aGUgdXNlciBzdGFydHMgYSB0cmFjaW5n
IHNlc3Npb24sIGEgYnVmZmVyIGlzIHNldCB1cCAqZWl0aGVyKiBhcyBhIGNvbXBsZXRlbHkgbm9y
bWFsIERNQSBhbGxvY2F0aW9uLCBvciBieSBtZW1yZW1hcCgpaW5nIHNvbWUgcmFuZG9tIElPVkEg
Y2FydmVvdXQgd2hpY2ggbWF5IG9yIG1heSBub3QgYmUgd2hhdGV2ZXIgbWVtb3J5IHRoZSBmaXJt
d2FyZSB3YXMgdHJhY2luZyB0by4KPiAKPiAtIFRoZSBoYXJkd2FyZSBpcyB0aGVuIHJlc2V0IGFu
ZCBjb21wbGV0ZWx5IHJlcHJvZ3JhbW1lZCB0byB1c2UgdGhlIG5ldyBidWZmZXIsIGFnYWluIHdp
dGhvdXQgYW55IGNvbnNpZGVyYXRpb24gb2YgaXRzIHByZXZpb3VzIHN0YXRlIChvdGhlciB0aGFu
IHBvc3NpYmx5IHRpbWluZyBvdXQgYW5kIGZhaWxpbmcgaWYgaXQncyBhbHJlYWR5IHJ1bm5pbmcg
YW5kIHRoYXQgbWVhbnMgaXQgbmV2ZXIgZ29lcyBpZGxlKS4KPiAKPiBUaGVyZWZvcmUgdGhlIGRy
aXZlciBkb2VzIG5vdCBzZWVtIHRvIHJlc3BlY3QgYW55IHByaW9yIGNvbmZpZ3VyYXRpb24gb2Yg
dGhlIGRldmljZSBieSBmaXJtd2FyZSwgZG9lcyBub3Qgc2VlbSB0byBleHBlY3QgaXQgdG8gYmUg
cnVubmluZyBhdCBib290IHRpbWUsIGRvZXMgbm90IHNlZW0gdG8gaGF2ZSBhbnkgd2F5IHRvIHBy
ZXNlcnZlIGFuZCBleHBvcnQgYW55IHRyYWNlIGRhdGEgY2FwdHVyZWQgaW4gYW4gUk1SIGlmIGl0
ICp3YXMqIHJ1bm5pbmcgYXQgYm9vdCB0aW1lLCBhbmQgdGh1cyB3aXRob3V0IGxvc3Mgb2YgZ2Vu
ZXJhbGl0eSBjb3VsZCBzaW1wbHkgdXNlIHRoZSBkbWFfYWxsb2NfY29oZXJlbnQoKSBwYXRoIGFs
bCB0aGUgdGltZS4gQW0gSSBtaXNzaW5nIGFueXRoaW5nPwo+IAoKVGhhbmtzIGZvciB0aGUgZnVy
dGhlciBleHBsYW5hdGlvbiBhbmQgSSB0aGluayBJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJucyBt
b3JlIGNsZWFyZXIuCgpUaGUgdHJhY2UgaXMgbm90IHN1cHBvc2VkIHRvIGJlZ2luIGJ5IHRoZSBm
aXJtd2FyZSBhdCBib290IHRpbWUuIER1ZSB0byBzb21lIGhhcmR3YXJlIHJlc3RyaWN0aW9uLCB0
aGUgZGV2aWNlIGNhbm5vdCB0cmFjZSB3aXRoIG5vbi1pZGVudGljYWwgbWFwcGluZy4KU28gd2Un
ZCBsaWtlIHRvIHVzZSBSTVIgdG8gbWFrZSB0aGUgZGV2aWNlIHdvcmsgd2hlbiB0aGUgZG1hIG1h
cHBpbmcgaXMgbm9uLWlkZW50aWNhbC4gVGh1cyB3ZSBjaGVjayBoZXJlIHRvIGRlY2lkZSB3aGV0
aGVyIHRvIHVzZSBSTVIgb3Igbm90OiBpZiB0aGUgaW9tbXUKaXMgbm90IHByZXNlbnRlZCBvciBp
biB0aGUgcGFzc3Rocm91Z2ggbW9kZSwgd2UgY2FuIHVzZSBkaXJlY3QgRE1BIGJ5IGRtYV9hbGxv
Y19jb2hlcmVudCgpOyBpZiB0aGUgaW9tbXUgaXMgcHJlc2VudCBhbmQgdGhlIG1vZGUgaXMgbm90
IHBhc3N0aHJvdWdoLCB3ZSB0cnkKdG8gcmV0cmlldmUgUk1SIG9yIHdlIGZhaWwgdGhlIHByb2Jl
LiBUaGUgZmlybXdhcmUgaXMgZXhwZWN0ZWQgdG8gcmVzZXJ2ZSBhIHJhbmdlIG9mIG1lbW9yeSBh
bmQgcmVwb3J0cyBpdCB0byB0aGUgZHJpdmVyIGFuZCBpcyBub3QgZXhwZWN0ZWQgdG8gY29uZmln
dXJlCnRoZSB0cmFjZSBhbmQgZG8gYm9vdCB0aW1lIHRyYWNpbmcuCgo+IEFzIHRoaW5ncyBzdGFu
ZCwgUk1ScyBhcmUgbm90IHlldCBzdXBwb3J0ZWQgdXBzdHJlYW0gKEZZSSB3ZSdyZSBzdGlsbCB3
b3JraW5nIG9uIGZpeGluZyB0aGUgc3BlYy4uLiksIHNvIHRoZSBjb2RlIGFib3ZlIGlzIGF0IGJl
c3QgZGVhZCwgYW5kIGF0IHdvcnN0IGFjdGl2ZWx5IHdyb25nLiBGdXJ0aGVybW9yZSwgaWYgdGhl
IGV4cGVjdGVkIHVzYWdlIG1vZGVsICppcyogdGhhdCB0aGUga2VybmVsIGRyaXZlciBjb21wbGV0
ZWx5IHJlc2V0cyBhbmQgcmVwcm9ncmFtcyB0aGUgaGFyZHdhcmUsIHRoZW4gZXZlbiBpZiB0aGVy
ZSBpcyBhbiBSTVIgZm9yIGJvb3QtdGltZSB0cmFjaW5nIEkgd291bGQgcmF0aGVyIGV4cGVjdCBp
dCB0byBiZSBmbGFnZ2VkIGFzIHJlbWFwcGFibGUsIGFuZCB0aHVzIHBvdGVudGlhbGx5IGVuZCB1
cCBhcyBhbiBJT01NVV9SRVNWX0RJUkVDVF9SRUxBWEFCTEUgcmVzZXJ2YXRpb24gd2hpY2ggeW91
IHdvdWxkbid0IG1hdGNoIGFueXdheS4KPiAKClllcyB0aGUgZmlybXdhcmUgaXMgbm90IGV4cGVj
dGVkIHRvIHN0YXJ0IHRoZSB0cmFjZS4gV2lsbCBjaGFuZ2UgdGhlIGRlc2lyZWQgZmxhZyB0byBJ
T01NVV9SRVNWX0RJUkVDVF9SRUxBWEFCTEUgYW5kIGhhdmUgYSB0ZXN0LgoKPiBBbmQgYWZ0ZXIg
YWxsIHRoYXQsIGlmIHlvdSByZWFsbHkgZG8gaGF2ZSBhIGdlbnVpbmUgbmVlZCB0byByZXNwZWN0
IGFuZCBwcmVzZXJ2ZSBwcmlvciBmaXJtd2FyZSBjb25maWd1cmF0aW9uIG9mIHRoZSBkZXZpY2Us
IHRoZW4gSSB3b3VsZCBzdXJlbHkgZXhwZWN0IHRvIHNlZSB0aGUgZHJpdmVyIGFjdHVhbGx5IGRv
aW5nIGV4YWN0bHkgdGhhdC4gUHJlc3VtYWJseTogYXQgcHJvYmUgdGltZSwgbG9vayBhdCBUUkFD
RV9DVFJMOyBpZiB0aGUgZGV2aWNlIGlzIGFscmVhZHkgY29uZmlndXJlZCwgcmVhZCBvdXQgdGhh
dCBjb25maWd1cmF0aW9uIC0gZXNwZWNpYWxseSBpbmNsdWRpbmcgVFJBQ0VfQUREUl8qIC0gYW5k
IG1ha2Ugc3VyZSB0byByZXVzZSBpdC4gTm90IGdvIG9mZiBvbiBhIHRhbmdlbnQgYmxpbmRseSBw
b2tpbmcgaW50byBpbnRlcm5hbCBJT01NVSBBUEkgYWJzdHJhY3Rpb25zIGluIHRoZSB2YWluIGhv
cGUgdGhhdCB0aGUgZmlyc3QgdGhpbmcgeW91IGZpbmQgaGFwcGVucyB0byBiZSBzb3J0LW9mLXJl
bGF0ZWQgdG8gdGhlIGluZm9ybWF0aW9uIHRoYXQgeW91IGFjdHVhbGx5IGNhcmUgYWJvdXQuCj4g
CgpZZXMsIHdlIGRvIG5lZWQgUk1SIHRvIG1ha2UgdGhlIGRldmljZSB3b3JrIGF0IHNpdHVhdGlv
biB3aGVyZSB0aGUgbWFwcGluZyBpcyBub24taWRlbnRpY2FsLgoKV2UncmUgY2VydGFpbiB0aGF0
IHRoZSBiaW9zIHdvbid0IHN0YXJ0IGFuZCBjb25maWd1cmUgdGhlIHRyYWNlIGluIHRoaXMgZGV2
aWNlJ3MgdXNhZ2UsIGlzIGl0IHN0aWxsIG5lY2Vzc2FyeSB0byBtYWtlCmZpcm13YXJlIGNvbmZp
Z3VyZSB0aGUgVFJBQ0VfQUREUl8qIHRvIHRoZSBkZXZpY2U/CgpBcyBzdWdnZXN0ZWQsIEkgdGhp
bmsgSSdsbCBuZWVkIHRvIG1vZGlmeSB0aGUgUk1SIGNvZGVzIGxpa2UKCi0gY2hlY2sgVFJBQ0Vf
Q1RSTCwgYW5kIHN0b3AgaXQgaWYgaXQncyBzdGFydGVkLiAod29uJ3QgaGFwcGVuIGJ1dCBjaGVj
ayBmb3Igc2FuaXR5KQotIGlmIHNtbXUgaXMgbm90IHByZXNlbnRlZCwgdXNlIGRpcmVjdCBETUEK
LSB0cnkgdG8gcmV0cmlldmUgUk1SIGFkZHJlc3Mgd2l0aCBmbGFnIElPTU1VX1JFU1ZfRElSRUNU
X1JFTEFYQUJMRSAsIGlmIHByZXNlbnRlZCBzZXQgaGlzaV9wdHQtPmhhc19ybXIuIGluIHRoaXMg
Y2FzZSB3ZSB3b24ndCB1c2UgZGlyZWN0IERNQQotIGNoZWNrIGlmIHRoZSBUUkFDRV9BRERSXyog
aGFzIGJlZW4gY29uZmlndXJlZC4gaWYgc28gZG9uJ3QgcmVjb25maWd1cmUgaXQgd2hlbiB0cmFj
ZQotIGlmIG5vIHJtciBidXQgc21tdSB3b3JrcyBpbiBwYXNzdGhyb3VnaCBtb2RlLCB1c2UgZGly
ZWN0IERNQQotIG90aGVyd2lzZSBmYWlscyB0aGUgcHJvYmUKCklmIEkgbWlzcyBzb21ldGhpbmcg
cGxlYXNlIHBvaW50IGl0IG91dC4KClRoYW5rcywKWWljb25nCgoKCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21t
dUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
