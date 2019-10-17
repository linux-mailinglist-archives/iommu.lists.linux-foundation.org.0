Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BEFDA9AA
	for <lists.iommu@lfdr.de>; Thu, 17 Oct 2019 12:16:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F34621384;
	Thu, 17 Oct 2019 10:16:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 18597FC1
	for <iommu@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 10:16:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (unknown [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 214F38BD
	for <iommu@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 10:16:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68A8F1576;
	Thu, 17 Oct 2019 03:16:42 -0700 (PDT)
Received: from [10.1.36.183] (e121487-lin.cambridge.arm.com [10.1.36.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6B993F718;
	Thu, 17 Oct 2019 03:16:40 -0700 (PDT)
Subject: Re: [BUG] dma-ranges, reserved memory regions, dma_alloc_coherent:
	possible bug?
To: Alexandre Torgue <alexandre.torgue@st.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
References: <CAA2QUqLv+eLXuA_TdJ7zM4oBnGoFVOjRjAimuct2y=0MDuaZVQ@mail.gmail.com>
	<d983cf57-f13d-a680-21c4-09b5ca93bc64@arm.com>
	<acf0dd2c-7e12-fba6-b7f8-dfd78c892fe5@arm.com>
	<417fa080-08f9-9f35-687b-c0b82a61628d@arm.com>
	<294b8a71-6e97-96b7-1ef3-c752cf8a9130@st.com>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <252a5aca-c4bb-dd28-1875-a9d10ce94b99@arm.com>
Date: Thu, 17 Oct 2019 11:16:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <294b8a71-6e97-96b7-1ef3-c752cf8a9130@st.com>
Content-Language: en-US
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, Arnd Bergmann <arnd@arndb.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

T24gMTAvMTcvMTkgMTE6MDMgQU0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4gSGkgVmxhZAo+
IAo+IE9uIDEwLzE3LzE5IDExOjQ2IEFNLCBWbGFkaW1pciBNdXJ6aW4gd3JvdGU6Cj4+IE9uIDEw
LzE0LzE5IDQ6MDEgUE0sIFZsYWRpbWlyIE11cnppbiB3cm90ZToKPj4+IE9uIDEwLzE0LzE5IDI6
NTQgUE0sIFJvYmluIE11cnBoeSB3cm90ZToKPj4+PiBPbiAxMy8xMC8yMDE5IDE1OjI4LCBEYW5p
ZWxlIEFsZXNzYW5kcmVsbGkgd3JvdGU6Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+PiBJdCBsb29rcyBs
aWtlIGRtYV9hbGxvY19jb2hlcmVudCgpIGlzIHNldHRpbmcgdGhlIGRtYV9oYW5kbGUgb3V0cHV0
Cj4+Pj4+IHBhcmFtZXRlciB0byB0aGUgbWVtb3J5IHBoeXNpY2FsIGFkZHJlc3MgYW5kIG5vdCB0
aGUgZGV2aWNlIGJ1cwo+Pj4+PiBhZGRyZXNzIHdoZW4gdGhlIGRldmljZSBpcyB1c2luZyByZXNl
cnZlZCBtZW1vcnkgcmVnaW9ucyBmb3IgRE1BCj4+Pj4+IGFsbG9jYXRpb24uIFRoaXMgaXMgZGVz
cGl0ZSB1c2luZyAnZG1hX3JhbmdlcycgaW4gdGhlIGRldmljZSB0cmVlIHRvCj4+Pj4+IGRlc2Ny
aWJlIHRoZSBETUEgbWVtb3J5IG1hcHBpbmcuIElzIHRoaXMgZXhwZWN0ZWQgYmVoYXZpb3Igb3Ig
YSBidWc/Cj4+Pj4KPj4+PiBUaGF0IGRvZXMgc291bmQgbGlrZSBhIGJ1ZyA6KAo+Pj4+Cj4+Pj4+
IEhlcmUgaXMgYSByZWR1Y2VkIHZlcnNpb24gb2YgdGhlIGRldmljZSB0cmVlIEknbSB1c2luZzoK
Pj4+Pj4gXCB7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXNlcnZlZC1tZW1vcnkgewo+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDI+
Owo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0g
PDI+Owo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJhbmdlczsKPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBteWRldl9yc3ZkOiByc3ZkX21l
bUA0OTQ4MDAwMDAgewo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7Cj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDQg
MHg5NDgwMDAwMCAweDAgMHgyMDAwMDA+Owo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuby1tYXA7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBzb2Mgewo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8Mj47Cj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmFuZ2VzOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9yYW5nZXM7Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbXlidXMgewo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYW5nZXMgPSA8PjsKPj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hLXJhbmdlcyA9IDw+
Owo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb21wYXRpYmxlID0gInNpbXBsZS1idXMiOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI3NpemUt
Y2VsbHMgPSA8Mj47Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJhbmdlcyA9wqDCoMKgwqAgPDB4MCAweDDCoCAweDAgMHgwwqAgMHgwIDB4
ODAwMDAwMDA+Owo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkbWEtcmFuZ2VzID0gPDB4MCAweDgwMDAwMDAwwqAgMHg0IDB4ODAwMDAwMDAK
Pj4+Pj4gMHgwIDB4ODAwMDAwMDA+Owo+Pj4+Pgo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBteWRldmljZSB7Cj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b21wYXRpYmxlID0gIm15LWNvbXBhdGlibGUtc3RyaW5nIjsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbW9y
eS1yZWdpb24gPSA8Jm15ZGV2X3JzdmQ+Owo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+PiB9Owo+Pj4+Pgo+
Pj4+PiBJdCBsb29rcyBsaWtlIHRoaXMgaXNzdWUgd2FzIHByZXZpb3VzbHkgZml4ZWQgYnkgY29t
bWl0IGM0MWY5ZWE5OThmMwo+Pj4+PiAoImRyaXZlcnM6IGRtYS1jb2hlcmVudDogQWNjb3VudCBk
bWFfcGZuX29mZnNldCB3aGVuIHVzZWQgd2l0aCBkZXZpY2UKPj4+Pj4gdHJlZSIpIHdoaWNoIGlu
dHJvZHVjZWQgYSBuZXcgZnVuY3Rpb24gKCdkbWFfZ2V0X2RldmljZV9iYXNlKCknKSB0bwo+Pj4+
PiByZXR1cm4gdGhlIHJlc2VydmVkIG1lbW9yeSBhZGRyZXNzIGFzIHNlZW4gYnkgdGhlIGRldmlj
ZS4gSG93ZXZlciwKPj4+Pj4gc3VjaCBhIGZ1bmN0aW9uLCBldmVuIGlmIHN0aWxsIHRoZXJlLCBp
cyBub3QgdXNlZCBhbnltb3JlIGluIGxhdGVzdAo+Pj4+PiBjb2RlIChhcyBvZiB2NS40LXJjMiku
IFdhcyB0aGF0IGRvbmUgZm9yIGEgc3BlY2lmaWMgcmVhc29uPyBPciBpcyBpdAo+Pj4+PiBqdXN0
IGEgbWlzdGFrZT8KPj4+Pgo+Pj4+IEhtbSwgaXQgbG9va3MgbGlrZSA0M2ZjNTA5YzNlZmIgKCJk
bWEtY29oZXJlbnQ6IGludHJvZHVjZSBpbnRlcmZhY2UgZm9yIGRlZmF1bHQgRE1BIHBvb2wiKSBy
ZW1vdmVkIHRoZSBjYWxsZXIgb2YgZG1hX2dldF9kZXZpY2VfYmFzZSgpIGluIHRoZSBhbGxvYyBw
YXRoIHNob3J0bHkgYWZ0ZXIgaXQgd2FzIGludHJvZHVjZWQsIHdoaWNoIGNlcnRhaW5seSBhcHBl
YXJzIGFzIGlmIGl0IG1heSBoYXZlIGJlZW4gdW5pbnRlbnRpb25hbCAtIFZsYWRpbWlyPwo+Pj4K
Pj4+IEkgZG8gbm90IHJlbWVtYmVyIGl0IHdhcyBpbnRlbnRpb25hbC4gTG9va2luZyBhdCBoaXN0
b3J5LCBkZWZhdWx0IERNQSBwb29sIHdhcyBhIHJlc3BvbnNlCj4+PiB0byBhbm90aGVyIHJlcG9y
dC4gSG93ZXZlciwgbm93IEknbSB3b25kZXJpbmcgd2h5IGl0IHdhcyBub3QgY2F1Z2h0IGJ5IFNU
TTMyIC0gbW9zdCBvZiB0aGF0Cj4+PiB3b3JrIHdhcyByZXF1aXJlZCB0byBzdXBwb3J0ICJkbWEt
cmFuZ2VzIiB3aXRoIE5PTU1VK2NhY2hlcyAoQ29ydGV4LU03KS4KPj4+Cj4+PiBBbGV4IChvciBh
bnlib2R5IGVsc2UgZnJvbSBTVCksIG1heWJlIHlvdSBoYXZlIHNvbWUgaW5wdXQ/Cj4+Cj4+IFNl
ZW0gdGhleSBkbyBub3QgY2FyZSA6KQo+Pgo+IAo+IAo+IENvbmNlcm5pbmcsIHRoZSBkZWZhdWx0
IGRtYSBwb29sOgo+IAo+IC0gSXQgd2FzIGludHJvZHVjZWQgYmVjYXVzZSBkbWEgb24gY29ydGV4
TTcgY291bGRuJ3QgdXNlIGNhY2hlLWFibGUgbWVtb3J5IHJlZ2lvbi4gU28gd2UgY29uZmlndXJl
ZCBNUFUgaW4gYm9vdGxvYWRlciAoSSB0aGluayBpdCBjYW4gYmUgZG9uZSBub3cgYnkgS2VybmVs
KSBhIHNtYWxsICJubyBjYWNoZSIgbWVtb3J5IHJlZ2lvbiBhbmQgdGhlbiBkZWNsYXJlIHRoaXMg
c2FtZSByZWdpb24gaW4ga2VybmVsIGRldmljZSB0cmVlIGZvciB0aGUgZG1hIHBvb2wuIFdpdGhv
dXQgdGhhdCB3ZSBjYW4ndCBleGVjdXRlIGFueSBkbWEgdHJhc2ZlcnRzLgo+IAo+IFNvcnJ5IGZv
ciB0aGUgbGF0ZSBhbnN3ZXIgOigKClN0aWxsIGJldHRlciB0aGVuIG5vIGFuc3dlciA7KQoKWWVz
LCBJIHJlbWVtYmVyIHdoeSB3ZSBoYXZlIGRlZmF1bHQgRE1BIHBvb2wuIElJUkMsIFNUTSB1c2Vk
IGRtYS1yYW5nZXMsIGl0IGlzIGhvdwpjNDFmOWVhOTk4ZjMgKCJkcml2ZXJzOiBkbWEtY29oZXJl
bnQ6IEFjY291bnQgZG1hX3Bmbl9vZmZzZXQgd2hlbiB1c2VkIHdpdGggZGV2aWNlCnRyZWUiKSB3
YXMgZGlzY292ZXJlZC4gSXQgYWxzbyBtZWFucyB0aGF0IFNUTSBpcyBicm9rZW4gYWZ0ZXIgODc4
ZWMzNiAoQVJNOiBOT01NVToKV2lyZS11cCBkZWZhdWx0IERNQSBpbnRlcmZhY2UpIHdpdGggY29t
YmluYXRpb24gb2YgZG1hLXJhbmdlcyBhbmQgZGVmYXVsdCBETUEgcG9vbC4KSG92ZXJlciwgSSd2
ZSBuZXZlciBzZWVuIHJlcG9ydCBmcm9tIFNUTSwgc28gZWl0aGVyIEknbSBtaXNzaW5nIHNvbWV0
aGluZyBvciBzdWNoCmNvbWJpbmF0aW9uIGlzIG5vdCBpbiB1c2Ugbm93ZGF5cy4uLgoKQ2hlZXJz
ClZsYWRpbWlyCgo+IAo+IGFsZXg+IEknbSB3b25kZXJpbmcgaWYgSSd2ZSBtaXNzZWQgc29tZXRo
aW5nIHdpdGggZGlmZiBiZWxsb3cgKGl0IHdhcyBhIGxvbmcgdGltZSBhZ28gd2hlbiBJIHRvdWNo
ZWQgRE1BKT8KPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21tL2RtYS1tYXBwaW5nLW5vbW11
LmMgYi9hcmNoL2FybS9tbS9kbWEtbWFwcGluZy1ub21tdS5jCj4+IGluZGV4IGRiOTI0NzguLjI4
N2VmODkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21tL2RtYS1tYXBwaW5nLW5vbW11LmMKPj4g
KysrIGIvYXJjaC9hcm0vbW0vZG1hLW1hcHBpbmctbm9tbXUuYwo+PiBAQCAtMzUsNyArMzUsNyBA
QCBzdGF0aWMgdm9pZCAqYXJtX25vbW11X2RtYV9hbGxvYyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHNp
emVfdCBzaXplLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgbG9uZyBhdHRycykKPj4gwqAgwqAgewo+PiAtwqDCoMKgIHZvaWQgKnJldCA9IGRtYV9hbGxv
Y19mcm9tX2dsb2JhbF9jb2hlcmVudChzaXplLCBkbWFfaGFuZGxlKTsKPj4gK8KgwqDCoCB2b2lk
ICpyZXQgPSBkbWFfYWxsb2NfZnJvbV9nbG9iYWxfY29oZXJlbnQoZGV2LCBzaXplLCBkbWFfaGFu
ZGxlKTsKPj4gwqAgwqDCoMKgwqDCoCAvKgo+PiDCoMKgwqDCoMKgwqAgKiBkbWFfYWxsb2NfZnJv
bV9nbG9iYWxfY29oZXJlbnQoKSBtYXkgZmFpbCBiZWNhdXNlOgo+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9kbWEtbWFwcGluZy5oIGIvaW5jbHVkZS9saW51eC9kbWEtbWFwcGluZy5oCj4+
IGluZGV4IDRhMWM0ZmMuLjEwOTE4YzUgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1h
LW1hcHBpbmcuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1tYXBwaW5nLmgKPj4gQEAgLTE2
Miw3ICsxNjIsNyBAQCBpbnQgZG1hX3JlbGVhc2VfZnJvbV9kZXZfY29oZXJlbnQoc3RydWN0IGRl
dmljZSAqZGV2LCBpbnQgb3JkZXIsIHZvaWQgKnZhZGRyKTsKPj4gwqAgaW50IGRtYV9tbWFwX2Zy
b21fZGV2X2NvaGVyZW50KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9pZCAqY3B1X2Fk
ZHIsIHNpemVfdCBzaXplLCBpbnQgKnJldCk7Cj4+IMKgIC12b2lkICpkbWFfYWxsb2NfZnJvbV9n
bG9iYWxfY29oZXJlbnQoc3NpemVfdCBzaXplLCBkbWFfYWRkcl90ICpkbWFfaGFuZGxlKTsKPj4g
K3ZvaWQgKmRtYV9hbGxvY19mcm9tX2dsb2JhbF9jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHNzaXplX3Qgc2l6ZSwgZG1hX2FkZHJfdCAqZG1hX2hhbmRsZSk7Cj4+IMKgIGludCBkbWFfcmVs
ZWFzZV9mcm9tX2dsb2JhbF9jb2hlcmVudChpbnQgb3JkZXIsIHZvaWQgKnZhZGRyKTsKPj4gwqAg
aW50IGRtYV9tbWFwX2Zyb21fZ2xvYmFsX2NvaGVyZW50KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLCB2b2lkICpjcHVfYWRkciwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc2l6ZV90IHNpemUsIGludCAqcmV0KTsKPj4gQEAgLTE3Miw3ICsxNzIsNyBAQCBpbnQg
ZG1hX21tYXBfZnJvbV9nbG9iYWxfY29oZXJlbnQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
IHZvaWQgKmNwdV9hZGRyLAo+PiDCoCAjZGVmaW5lIGRtYV9yZWxlYXNlX2Zyb21fZGV2X2NvaGVy
ZW50KGRldiwgb3JkZXIsIHZhZGRyKSAoMCkKPj4gwqAgI2RlZmluZSBkbWFfbW1hcF9mcm9tX2Rl
dl9jb2hlcmVudChkZXYsIHZtYSwgdmFkZHIsIG9yZGVyLCByZXQpICgwKQo+PiDCoCAtc3RhdGlj
IGlubGluZSB2b2lkICpkbWFfYWxsb2NfZnJvbV9nbG9iYWxfY29oZXJlbnQoc3NpemVfdCBzaXpl
LAo+PiArc3RhdGljIGlubGluZSB2b2lkICpkbWFfYWxsb2NfZnJvbV9nbG9iYWxfY29oZXJlbnQo
c3RydWN0IGRldmljZSAqZGV2LCBzc2l6ZV90IHNpemUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9hZGRyX3QgKmRtYV9oYW5k
bGUpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsKPj4gZGlmZiAtLWdpdCBhL2tl
cm5lbC9kbWEvY29oZXJlbnQuYyBiL2tlcm5lbC9kbWEvY29oZXJlbnQuYwo+PiBpbmRleCA1NDVl
Mzg2Li41NTFiMGViIDEwMDY0NAo+PiAtLS0gYS9rZXJuZWwvZG1hL2NvaGVyZW50LmMKPj4gKysr
IGIva2VybmVsL2RtYS9jb2hlcmVudC5jCj4+IEBAIC0xMjMsOCArMTIzLDkgQEAgaW50IGRtYV9k
ZWNsYXJlX2NvaGVyZW50X21lbW9yeShzdHJ1Y3QgZGV2aWNlICpkZXYsIHBoeXNfYWRkcl90IHBo
eXNfYWRkciwKPj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDCoCB9Cj4+IMKgIC1zdGF0aWMg
dm9pZCAqX19kbWFfYWxsb2NfZnJvbV9jb2hlcmVudChzdHJ1Y3QgZG1hX2NvaGVyZW50X21lbSAq
bWVtLAo+PiAtwqDCoMKgwqDCoMKgwqAgc3NpemVfdCBzaXplLCBkbWFfYWRkcl90ICpkbWFfaGFu
ZGxlKQo+PiArc3RhdGljIHZvaWQgKl9fZG1hX2FsbG9jX2Zyb21fY29oZXJlbnQoc3RydWN0IGRl
dmljZSAqZGV2LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGRtYV9jb2hlcmVudF9tZW0gKm1lbSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNzaXplX3Qgc2l6ZSwgZG1hX2FkZHJfdCAqZG1hX2hh
bmRsZSkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIGludCBvcmRlciA9IGdldF9vcmRlcihzaXplKTsK
Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+PiBAQCAtMTQzLDcgKzE0NCw3IEBA
IHN0YXRpYyB2b2lkICpfX2RtYV9hbGxvY19mcm9tX2NvaGVyZW50KHN0cnVjdCBkbWFfY29oZXJl
bnRfbWVtICptZW0sCj4+IMKgwqDCoMKgwqAgLyoKPj4gwqDCoMKgwqDCoMKgICogTWVtb3J5IHdh
cyBmb3VuZCBpbiB0aGUgY29oZXJlbnQgYXJlYS4KPj4gwqDCoMKgwqDCoMKgICovCj4+IC3CoMKg
wqAgKmRtYV9oYW5kbGUgPSBtZW0tPmRldmljZV9iYXNlICsgKHBhZ2VubyA8PCBQQUdFX1NISUZU
KTsKPj4gK8KgwqDCoCAqZG1hX2hhbmRsZSA9IGRtYV9nZXRfZGV2aWNlX2Jhc2UoZGV2LCBtZW0p
ICsgKHBhZ2VubyA8PCBQQUdFX1NISUZUKTsKPj4gwqDCoMKgwqDCoCByZXQgPSBtZW0tPnZpcnRf
YmFzZSArIChwYWdlbm8gPDwgUEFHRV9TSElGVCk7Cj4+IMKgwqDCoMKgwqAgc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmbWVtLT5zcGlubG9jaywgZmxhZ3MpOwo+PiDCoMKgwqDCoMKgIG1lbXNldChy
ZXQsIDAsIHNpemUpOwo+PiBAQCAtMTc1LDE3ICsxNzYsMTggQEAgaW50IGRtYV9hbGxvY19mcm9t
X2Rldl9jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpkZXYsIHNzaXplX3Qgc2l6ZSwKPj4gwqDCoMKg
wqDCoCBpZiAoIW1lbSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCAtwqDC
oMKgICpyZXQgPSBfX2RtYV9hbGxvY19mcm9tX2NvaGVyZW50KG1lbSwgc2l6ZSwgZG1hX2hhbmRs
ZSk7Cj4+ICvCoMKgwqAgKnJldCA9IF9fZG1hX2FsbG9jX2Zyb21fY29oZXJlbnQoZGV2LCBtZW0s
IHNpemUsIGRtYV9oYW5kbGUpOwo+PiDCoMKgwqDCoMKgIHJldHVybiAxOwo+PiDCoCB9Cj4+IMKg
IC12b2lkICpkbWFfYWxsb2NfZnJvbV9nbG9iYWxfY29oZXJlbnQoc3NpemVfdCBzaXplLCBkbWFf
YWRkcl90ICpkbWFfaGFuZGxlKQo+PiArdm9pZCAqZG1hX2FsbG9jX2Zyb21fZ2xvYmFsX2NvaGVy
ZW50KHN0cnVjdCBkZXZpY2UgKmRldiwgc3NpemVfdCBzaXplLAo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfYWRkcl90ICpkbWFfaGFuZGxlKQo+PiDCoCB7
Cj4+IMKgwqDCoMKgwqAgaWYgKCFkbWFfY29oZXJlbnRfZGVmYXVsdF9tZW1vcnkpCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsKPj4gwqAgLcKgwqDCoCByZXR1cm4gX19kbWFfYWxs
b2NfZnJvbV9jb2hlcmVudChkbWFfY29oZXJlbnRfZGVmYXVsdF9tZW1vcnksIHNpemUsCj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9oYW5kbGUpOwo+PiArwqDCoMKgIHJldHVybiBfX2Rt
YV9hbGxvY19mcm9tX2NvaGVyZW50KGRldiwgZG1hX2NvaGVyZW50X2RlZmF1bHRfbWVtb3J5LCBz
aXplLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfaGFu
ZGxlKTsKPj4gwqAgfQo+PiDCoCDCoCBzdGF0aWMgaW50IF9fZG1hX3JlbGVhc2VfZnJvbV9jb2hl
cmVudChzdHJ1Y3QgZG1hX2NvaGVyZW50X21lbSAqbWVtLAo+Pgo+Pj4KPj4+IENoZWVycwo+Pj4g
VmxhZGltaXIKPj4+Cj4+Pj4KPj4+PiBSb2Jpbi4KPj4+Cj4+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vaW9tbXU=
