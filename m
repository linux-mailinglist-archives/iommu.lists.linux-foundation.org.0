Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C674D4C28F8
	for <lists.iommu@lfdr.de>; Thu, 24 Feb 2022 11:13:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4312D40117;
	Thu, 24 Feb 2022 10:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DtESCodaLQxD; Thu, 24 Feb 2022 10:13:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B89F1400EA;
	Thu, 24 Feb 2022 10:13:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90F61C0036;
	Thu, 24 Feb 2022 10:13:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FC6CC0011
 for <iommu@lists.linux-foundation.org>; Thu, 24 Feb 2022 10:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DB8C60B2D
 for <iommu@lists.linux-foundation.org>; Thu, 24 Feb 2022 10:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 18A_xZQpofm0 for <iommu@lists.linux-foundation.org>;
 Thu, 24 Feb 2022 10:13:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EF2C60AC0
 for <iommu@lists.linux-foundation.org>; Thu, 24 Feb 2022 10:13:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02E93ED1;
 Thu, 24 Feb 2022 02:13:41 -0800 (PST)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E56B3F70D;
 Thu, 24 Feb 2022 02:13:39 -0800 (PST)
Date: Thu, 24 Feb 2022 10:13:33 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v8 03/11] ACPI/IORT: Add helper functions to parse RMR
 nodes
Message-ID: <20220224101333.GA3178@lpieralisi>
References: <20220221154344.2126-1-shameerali.kolothum.thodi@huawei.com>
 <20220221154344.2126-4-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221154344.2126-4-shameerali.kolothum.thodi@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: will@kernel.org, jon@solid-run.com, linuxarm@huawei.com,
 steven.price@arm.com, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, wanghuiqiang@huawei.com,
 guohanjun@huawei.com, yangyicong@huawei.com, Sami.Mujawar@arm.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

T24gTW9uLCBGZWIgMjEsIDIwMjIgYXQgMDM6NDM6MzZQTSArMDAwMCwgU2hhbWVlciBLb2xvdGh1
bSB3cm90ZToKPiBUaGUgaGVscGVyIGZ1bmN0aW9ucyBoZXJlIHBhcnNlIHRocm91Z2ggdGhlIElP
UlQgUk1SIG5vZGVzIGFuZAo+IHBvcHVsYXRlIGEgcmVzZXJ2ZWQgcmVnaW9uIGxpc3QgIGNvcnJl
c3BvbmRpbmcgdG8gYSBnaXZlbiBpb21tdQo+IGFuZCBkZXZpY2Uob3B0aW9uYWwpLiBUaGVzZSBh
bHNvIGdvIHRocm91Z2ggdGhlIElEIG1hcHBpbmdzIG9mCj4gdGhlIFJNUiBub2RlIGFuZCByZXRy
aWV2ZXMgYWxsIHRoZSBTSURzIGFzc29jaWF0ZWQgd2l0aCBhIFJNUgo+IGRlc2NyaXB0b3IuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogU2hhbWVlciBLb2xvdGh1bSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50
aG9kaUBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2FjcGkvYXJtNjQvaW9ydC5jIHwgMjI1
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyMjUgaW5zZXJ0aW9ucygrKQoKSSBoYXZlIHZlcnkgbWlub3IgY29tbWVudHMgLSBJIHdvdWxk
IGFzayBSb2JpbiB0byBhY2sgdGhlIHVwZGF0ZWQKZmxhZ3MgbWFuYWdlbWVudC4KCkZ1bmN0aW9u
cyBzaG91bGQgYmUgaW50cm9kdWNlZCB3aGVyZSB0aGV5IGFyZSB1c2VkLCB0aGlzIHBhdGNoCmlz
IG5vdCBiaXNlY3RhYmxlOgoKZHJpdmVycy9hY3BpL2FybTY0L2lvcnQuYzoxMDI4OjEzOiB3YXJu
aW5nOiDigJhpb3J0X2ZpbmRfcm1yc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
ZnVuY3Rpb25dCiAxMDI4IHwgc3RhdGljIHZvaWQgaW9ydF9maW5kX3JtcnMoc3RydWN0IGFjcGlf
aW9ydF9ub2RlICppb21tdSwgc3RydWN0IGRldmljZSAqZGV2LAoKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9hY3BpL2FybTY0L2lvcnQuYyBiL2RyaXZlcnMvYWNwaS9hcm02NC9pb3J0LmMKPiBpbmRl
eCAwNzMwYzRkYmI3MDAuLjA1ZGE5ZWJmZjUwYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjcGkv
YXJtNjQvaW9ydC5jCj4gKysrIGIvZHJpdmVycy9hY3BpL2FybTY0L2lvcnQuYwo+IEBAIC04MzAs
NiArODMwLDIzMSBAQCBzdGF0aWMgc3RydWN0IGFjcGlfaW9ydF9ub2RlICppb3J0X2dldF9tc2lf
cmVzdl9pb21tdShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAlyZXR1cm4gTlVMTDsKPiAgfQo+ICAK
PiArc3RhdGljIHZvaWQgaW9ydF9ybXJfZGVzY19jaGVja19vdmVybGFwKHN0cnVjdCBhY3BpX2lv
cnRfcm1yX2Rlc2MgKmRlc2MsIHUzMiBjb3VudCkKPiArewo+ICsJaW50IGksIGo7Cj4gKwo+ICsJ
Zm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKPiArCQl1NjQgZW5kLCBzdGFydCA9IGRlc2Nb
aV0uYmFzZV9hZGRyZXNzLCBsZW5ndGggPSBkZXNjW2ldLmxlbmd0aDsKPiArCj4gKwkJZW5kID0g
c3RhcnQgKyBsZW5ndGggLSAxOwoKV2UgY291bGQgcHJvYmFibHkgY2hlY2sgZm9yIGxlbmd0aCAh
PSAwLCB0aGUga2VybmVsIGlzIG5vdCB0aGVyZSB0bwp2YWxpZGF0ZSBmaXJtd2FyZSBidXQgdGhp
cyB3b3VsZCBub3QgaHVydCBlaXRoZXIuCgo+ICsKPiArCQkvKiBDaGVjayBmb3IgYWRkcmVzcyBv
dmVybGFwICovCj4gKwkJZm9yIChqID0gaSArIDE7IGogPCBjb3VudDsgaisrKSB7Cj4gKwkJCXU2
NCBlX3N0YXJ0ID0gZGVzY1tqXS5iYXNlX2FkZHJlc3M7Cj4gKwkJCXU2NCBlX2VuZCA9IGVfc3Rh
cnQgKyBkZXNjW2pdLmxlbmd0aCAtIDE7Cj4gKwo+ICsJCQlpZiAoc3RhcnQgPD0gZV9lbmQgJiYg
ZW5kID49IGVfc3RhcnQpCj4gKwkJCQlwcl9lcnIoRldfQlVHICJSTVIgZGVzY3JpcHRvclsweCVs
bHggLSAweCVsbHhdIG92ZXJsYXBzLCBjb250aW51ZSBhbnl3YXlcbiIsCj4gKwkJCQkgICAgICAg
c3RhcnQsIGVuZCk7Cj4gKwkJfQo+ICsJfQo+ICt9Cj4gKwo+ICsvKgo+ICsgKiBQbGVhc2Ugbm90
ZSwgd2Ugd2lsbCBrZWVwIHRoZSBhbHJlYWR5IGFsbG9jYXRlZCBSTVIgcmVzZXJ2ZQo+ICsgKiBy
ZWdpb25zIGluIGNhc2Ugb2YgYSBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlLgo+ICsgKi8KPiAr
c3RhdGljIHZvaWQgaW9ydF9ybXJfZ2V0X3Jlc3ZfcmVnaW9ucyhzdHJ1Y3QgYWNwaV9pb3J0X25v
ZGUgKm5vZGUsCj4gKwkJCQkgICAgICBzdHJ1Y3QgYWNwaV9pb3J0X25vZGUgKnNtbXUsCj4gKwkJ
CQkgICAgICB1MzIgKnNpZHMsIHUzMiBudW1fc2lkcywKPiArCQkJCSAgICAgIHN0cnVjdCBsaXN0
X2hlYWQgKmhlYWQpCj4gK3sKPiArCXN0cnVjdCBhY3BpX2lvcnRfcm1yICpybXIgPSAoc3RydWN0
IGFjcGlfaW9ydF9ybXIgKilub2RlLT5ub2RlX2RhdGE7Cj4gKwlzdHJ1Y3QgYWNwaV9pb3J0X3Jt
cl9kZXNjICpybXJfZGVzYzsKPiArCWludCBpOwo+ICsKPiArCXJtcl9kZXNjID0gQUNQSV9BRERf
UFRSKHN0cnVjdCBhY3BpX2lvcnRfcm1yX2Rlc2MsIG5vZGUsCj4gKwkJCQlybXItPnJtcl9vZmZz
ZXQpOwo+ICsKPiArCWlvcnRfcm1yX2Rlc2NfY2hlY2tfb3ZlcmxhcChybXJfZGVzYywgcm1yLT5y
bXJfY291bnQpOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBybXItPnJtcl9jb3VudDsgaSsrLCBy
bXJfZGVzYysrKSB7Cj4gKwkJc3RydWN0IGlvbW11X3Jlc3ZfcmVnaW9uICpyZWdpb247Cj4gKwkJ
ZW51bSBpb21tdV9yZXN2X3R5cGUgdHlwZTsKPiArCQl1MzIgICpzaWRzX2NvcHk7Cj4gKwkJaW50
IHByb3QgPSBJT01NVV9SRUFEIHwgSU9NTVVfV1JJVEU7Cj4gKwkJdTY0IGFkZHIgPSBybXJfZGVz
Yy0+YmFzZV9hZGRyZXNzLCBzaXplID0gcm1yX2Rlc2MtPmxlbmd0aDsKPiArCj4gKwkJaWYgKCFJ
U19BTElHTkVEKGFkZHIsIFNaXzY0SykgfHwgIUlTX0FMSUdORUQoc2l6ZSwgU1pfNjRLKSkgewo+
ICsJCQkvKiBQQUdFIGFsaWduIGJhc2UgYWRkciBhbmQgc2l6ZSAqLwo+ICsJCQlhZGRyICY9IFBB
R0VfTUFTSzsKPiArCQkJc2l6ZSA9IFBBR0VfQUxJR04oc2l6ZSArIG9mZnNldF9pbl9wYWdlKHJt
cl9kZXNjLT5iYXNlX2FkZHJlc3MpKTsKPiArCj4gKwkJCXByX2VycihGV19CVUcgIlJNUiBkZXNj
cmlwdG9yWzB4JWxseCAtIDB4JWxseF0gbm90IGFsaWduZWQgdG8gNjRLLCBjb250aW51ZSB3aXRo
IFsweCVsbHggLSAweCVsbHhdXG4iLAo+ICsJCQkgICAgICAgcm1yX2Rlc2MtPmJhc2VfYWRkcmVz
cywKPiArCQkJICAgICAgIHJtcl9kZXNjLT5iYXNlX2FkZHJlc3MgKyBybXJfZGVzYy0+bGVuZ3Ro
IC0gMSwKPiArCQkJICAgICAgIGFkZHIsIGFkZHIgKyBzaXplIC0gMSk7Cj4gKwkJfQo+ICsKPiAr
CQlpZiAocm1yLT5mbGFncyAmIEFDUElfSU9SVF9STVJfUkVNQVBfUEVSTUlUVEVEKQo+ICsJCQl0
eXBlID0gSU9NTVVfUkVTVl9ESVJFQ1RfUkVMQVhBQkxFOwo+ICsJCWVsc2UKPiArCQkJdHlwZSA9
IElPTU1VX1JFU1ZfRElSRUNUOwo+ICsKPiArCQlpZiAocm1yLT5mbGFncyAmIEFDUElfSU9SVF9S
TVJfQUNDRVNTX1BSSVZJTEVHRSkKPiArCQkJcHJvdCB8PSBJT01NVV9QUklWOwo+ICsKPiArCQkv
KiBBdHRyaWJ1dGVzIDB4MDAgLSAweDAzIHJlcHJlc2VudHMgZGV2aWNlIG1lbW9yeSAqLwo+ICsJ
CWlmIChBQ1BJX0lPUlRfUk1SX0FDQ0VTU19BVFRSSUJVVEVTKHJtci0+ZmxhZ3MpIDw9Cj4gKwkJ
CQlBQ1BJX0lPUlRfUk1SX0FUVFJfREVWSUNFX0dSRSkKPiArCQkJcHJvdCB8PSBJT01NVV9NTUlP
Owo+ICsJCWVsc2UgaWYgKEFDUElfSU9SVF9STVJfQUNDRVNTX0FUVFJJQlVURVMocm1yLT5mbGFn
cykgPT0KPiArCQkJCUFDUElfSU9SVF9STVJfQVRUUl9OT1JNQUwpCj4gKwkJCXByb3QgfD0gSU9N
TVVfQ0FDSEU7Cj4gKwo+ICsJCS8qIENyZWF0ZSBhIGNvcHkgb2Ygc2lkcyBhcnJheSB0byBhc3Nv
Y2lhdGUgd2l0aCB0aGlzIHJlc3YgcmVnaW9uICovCj4gKwkJc2lkc19jb3B5ID0ga21lbWR1cChz
aWRzLCBudW1fc2lkcyAqIHNpemVvZigqc2lkcyksIEdGUF9LRVJORUwpOwo+ICsJCWlmICghc2lk
c19jb3B5KQo+ICsJCQlyZXR1cm47Cj4gKwo+ICsJCXJlZ2lvbiA9IGlvbW11X2FsbG9jX3Jlc3Zf
cmVnaW9uKGFkZHIsIHNpemUsIHByb3QsIHR5cGUpOwo+ICsJCWlmICghcmVnaW9uKSB7Cj4gKwkJ
CWtmcmVlKHNpZHNfY29weSk7Cj4gKwkJCXJldHVybjsKPiArCQl9Cj4gKwo+ICsJCXJlZ2lvbi0+
ZndfZGF0YS5ybXIuc2lkcyA9IHNpZHNfY29weTsKPiArCQlyZWdpb24tPmZ3X2RhdGEucm1yLm51
bV9zaWRzID0gbnVtX3NpZHM7Cj4gKwkJbGlzdF9hZGRfdGFpbCgmcmVnaW9uLT5saXN0LCBoZWFk
KTsKPiArCX0KPiArfQo+ICsKPiArc3RhdGljIHUzMiAqaW9ydF9ybXJfYWxsb2Nfc2lkcyh1MzIg
KnNpZHMsIHUzMiBjb3VudCwgdTMyIGlkX3N0YXJ0LAo+ICsJCQkJdTMyIG5ld19jb3VudCkKPiAr
ewo+ICsJdTMyICpuZXdfc2lkczsKPiArCXUzMiB0b3RhbF9jb3VudCA9IGNvdW50ICsgbmV3X2Nv
dW50Owo+ICsJaW50IGk7Cj4gKwo+ICsJbmV3X3NpZHMgPSBrcmVhbGxvY19hcnJheShzaWRzLCBj
b3VudCArIG5ld19jb3VudCwKPiArCQkJCSAgc2l6ZW9mKCpuZXdfc2lkcyksIEdGUF9LRVJORUwp
Owo+ICsJaWYgKCFuZXdfc2lkcykKPiArCQlyZXR1cm4gTlVMTDsKPiArCj4gKwkvKlVwZGF0ZSBu
ZXcgb25lcyAqLwoKLyogVXBkYXRlIG5ldyBvbmVzICovCgpJJ2QgcmVtb3ZlIHRoZSBjb21tZW50
LCBvciBpbXByb3ZlIGl0LCBhcyBpdCBzdGFuZHMgaXQgZG9lcyBub3QKaGVscCBtdWNoIC0gd2Ug
Y2FuIHJlYWQgdGhlIGNvZGUuCgo+ICsJZm9yIChpID0gY291bnQ7IGkgPCB0b3RhbF9jb3VudDsg
aSsrKQo+ICsJCW5ld19zaWRzW2ldID0gaWRfc3RhcnQrKzsKPiArCj4gKwlyZXR1cm4gbmV3X3Np
ZHM7Cj4gK30KPiArCj4gK3N0YXRpYyBib29sIGlvcnRfcm1yX2hhc19kZXYoc3RydWN0IGRldmlj
ZSAqZGV2LCB1MzIgaWRfc3RhcnQsCj4gKwkJCSAgICAgdTMyIGlkX2NvdW50KQo+ICt7Cj4gKwlp
bnQgaTsKPiArCXN0cnVjdCBpb21tdV9md3NwZWMgKmZ3c3BlYyA9IGRldl9pb21tdV9md3NwZWNf
Z2V0KGRldik7Cj4gKwo+ICsJaWYgKGRldl9pc19wY2koZGV2KSkgewo+ICsJCXN0cnVjdCBwY2lf
ZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwo+ICsJCXN0cnVjdCBwY2lfaG9zdF9icmlkZ2Ug
Kmhvc3QgPSBwY2lfZmluZF9ob3N0X2JyaWRnZShwZGV2LT5idXMpOwo+ICsKPiArCQlpZiAoIWhv
c3QtPnByZXNlcnZlX2NvbmZpZykKClBsZWFzZSBhZGQgYSBjb21tZW50IGhlcmUgLSBpdCBoZWxw
cyBleHBsYWluIHRoZSBsb2dpYyBiZWhpbmQgaXQuCgpUaGFua3MsCkxvcmVuem8KCj4gKwkJCXJl
dHVybiBmYWxzZTsKPiArCX0KPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgZndzcGVjLT5udW1faWRz
OyBpKyspIHsKPiArCQlpZiAoZndzcGVjLT5pZHNbaV0gPj0gaWRfc3RhcnQgJiYKPiArCQkgICAg
ZndzcGVjLT5pZHNbaV0gPD0gaWRfc3RhcnQgKyBpZF9jb3VudCkKPiArCQkJcmV0dXJuIHRydWU7
Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBpb3J0
X25vZGVfZ2V0X3Jtcl9pbmZvKHN0cnVjdCBhY3BpX2lvcnRfbm9kZSAqbm9kZSwKPiArCQkJCSAg
IHN0cnVjdCBhY3BpX2lvcnRfbm9kZSAqaW9tbXUsCj4gKwkJCQkgICBzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQpCj4gK3sKPiArCXN0cnVjdCBhY3BpX2lvcnRfbm9k
ZSAqc21tdSA9IE5VTEw7Cj4gKwlzdHJ1Y3QgYWNwaV9pb3J0X3JtciAqcm1yOwo+ICsJc3RydWN0
IGFjcGlfaW9ydF9pZF9tYXBwaW5nICptYXA7Cj4gKwl1MzIgKnNpZHMgPSBOVUxMOwo+ICsJdTMy
IG51bV9zaWRzID0gMDsKPiArCWludCBpOwo+ICsKPiArCWlmICghbm9kZS0+bWFwcGluZ19vZmZz
ZXQgfHwgIW5vZGUtPm1hcHBpbmdfY291bnQpIHsKPiArCQlwcl9lcnIoRldfQlVHICJJbnZhbGlk
IElEIG1hcHBpbmcsIHNraXBwaW5nIFJNUiBub2RlICVwXG4iLAo+ICsJCSAgICAgICBub2RlKTsK
PiArCQlyZXR1cm47Cj4gKwl9Cj4gKwo+ICsJcm1yID0gKHN0cnVjdCBhY3BpX2lvcnRfcm1yICop
bm9kZS0+bm9kZV9kYXRhOwo+ICsJaWYgKCFybXItPnJtcl9vZmZzZXQgfHwgIXJtci0+cm1yX2Nv
dW50KQo+ICsJCXJldHVybjsKPiArCj4gKwltYXAgPSBBQ1BJX0FERF9QVFIoc3RydWN0IGFjcGlf
aW9ydF9pZF9tYXBwaW5nLCBub2RlLAo+ICsJCQkgICBub2RlLT5tYXBwaW5nX29mZnNldCk7Cj4g
Kwo+ICsJLyoKPiArCSAqIEdvIHRocm91Z2ggdGhlIElEIG1hcHBpbmdzIGFuZCBzZWUgaWYgd2Ug
aGF2ZSBhIG1hdGNoCj4gKwkgKiBmb3Igc21tdSBhbmQgZGV2KGlmICFOVUxMKS4gSWYgZm91bmQs
IGdldCB0aGUgc2lkcwo+ICsJICogZm9yIHRoZSBOb2RlLgo+ICsJICogUGxlYXNlIG5vdGUsIGlk
X2NvdW50IGlzIGVxdWFsIHRvIHRoZSBudW1iZXIgb2YgSURzCj4gKwkgKiBpbiB0aGUgcmFuZ2Ug
bWludXMgb25lLgo+ICsJICovCj4gKwlmb3IgKGkgPSAwOyBpIDwgbm9kZS0+bWFwcGluZ19jb3Vu
dDsgaSsrLCBtYXArKykgewo+ICsJCXN0cnVjdCBhY3BpX2lvcnRfbm9kZSAqcGFyZW50Owo+ICsK
PiArCQlpZiAoIW1hcC0+aWRfY291bnQpCj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQlwYXJlbnQg
PSBBQ1BJX0FERF9QVFIoc3RydWN0IGFjcGlfaW9ydF9ub2RlLCBpb3J0X3RhYmxlLAo+ICsJCQkJ
ICAgICAgbWFwLT5vdXRwdXRfcmVmZXJlbmNlKTsKPiArCQlpZiAocGFyZW50ICE9IGlvbW11KQo+
ICsJCQljb250aW51ZTsKPiArCj4gKwkJLyogSWYgZGV2IGlzIHZhbGlkLCBjaGVjayBSTVIgbm9k
ZSBjb3JyZXNwb25kcyB0byB0aGUgZGV2IHNpZCAqLwo+ICsJCWlmIChkZXYgJiYgIWlvcnRfcm1y
X2hhc19kZXYoZGV2LCBtYXAtPm91dHB1dF9iYXNlLAo+ICsJCQkJCSAgICAgbWFwLT5pZF9jb3Vu
dCkpCj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQkvKiBSZXRyaWV2ZSBzaWRzIGFzc29jaWF0ZWQg
d2l0aCB0aGUgTm9kZS4gKi8KPiArCQlzaWRzID0gaW9ydF9ybXJfYWxsb2Nfc2lkcyhzaWRzLCBu
dW1fc2lkcywgbWFwLT5vdXRwdXRfYmFzZSwKPiArCQkJCQkgICBtYXAtPmlkX2NvdW50ICsgMSk7
Cj4gKwkJaWYgKCFzaWRzKQo+ICsJCQlyZXR1cm47Cj4gKwo+ICsJCW51bV9zaWRzICs9IG1hcC0+
aWRfY291bnQgKyAxOwo+ICsJfQo+ICsKPiArCWlmICghc2lkcykKPiArCQlyZXR1cm47Cj4gKwo+
ICsJaW9ydF9ybXJfZ2V0X3Jlc3ZfcmVnaW9ucyhub2RlLCBzbW11LCBzaWRzLCBudW1fc2lkcywg
aGVhZCk7Cj4gKwlrZnJlZShzaWRzKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgaW9ydF9maW5k
X3JtcnMoc3RydWN0IGFjcGlfaW9ydF9ub2RlICppb21tdSwgc3RydWN0IGRldmljZSAqZGV2LAo+
ICsJCQkgICBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkKQo+ICt7Cj4gKwlzdHJ1Y3QgYWNwaV90YWJs
ZV9pb3J0ICppb3J0Owo+ICsJc3RydWN0IGFjcGlfaW9ydF9ub2RlICppb3J0X25vZGUsICppb3J0
X2VuZDsKPiArCWludCBpOwo+ICsKPiArCWlmIChpb3J0X3RhYmxlLT5yZXZpc2lvbiA8IDUpCj4g
KwkJcmV0dXJuOwo+ICsKPiArCWlvcnQgPSAoc3RydWN0IGFjcGlfdGFibGVfaW9ydCAqKWlvcnRf
dGFibGU7Cj4gKwo+ICsJaW9ydF9ub2RlID0gQUNQSV9BRERfUFRSKHN0cnVjdCBhY3BpX2lvcnRf
bm9kZSwgaW9ydCwKPiArCQkJCSBpb3J0LT5ub2RlX29mZnNldCk7Cj4gKwlpb3J0X2VuZCA9IEFD
UElfQUREX1BUUihzdHJ1Y3QgYWNwaV9pb3J0X25vZGUsIGlvcnQsCj4gKwkJCQlpb3J0X3RhYmxl
LT5sZW5ndGgpOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBpb3J0LT5ub2RlX2NvdW50OyBpKysp
IHsKPiArCQlpZiAoV0FSTl9UQUlOVChpb3J0X25vZGUgPj0gaW9ydF9lbmQsIFRBSU5UX0ZJUk1X
QVJFX1dPUktBUk9VTkQsCj4gKwkJCSAgICAgICAiSU9SVCBub2RlIHBvaW50ZXIgb3ZlcmZsb3dz
LCBiYWQgdGFibGUhXG4iKSkKPiArCQkJcmV0dXJuOwo+ICsKPiArCQlpZiAoaW9ydF9ub2RlLT50
eXBlID09IEFDUElfSU9SVF9OT0RFX1JNUikKPiArCQkJaW9ydF9ub2RlX2dldF9ybXJfaW5mbyhp
b3J0X25vZGUsIGlvbW11LCBkZXYsIGhlYWQpOwo+ICsKPiArCQlpb3J0X25vZGUgPSBBQ1BJX0FE
RF9QVFIoc3RydWN0IGFjcGlfaW9ydF9ub2RlLCBpb3J0X25vZGUsCj4gKwkJCQkJIGlvcnRfbm9k
ZS0+bGVuZ3RoKTsKPiArCX0KPiArfQo+ICsKPiAgLyoqCj4gICAqIGlvcnRfaW9tbXVfbXNpX2dl
dF9yZXN2X3JlZ2lvbnMgLSBSZXNlcnZlZCByZWdpb24gZHJpdmVyIGhlbHBlcgo+ICAgKiBAZGV2
OiBEZXZpY2UgZnJvbSBpb21tdV9nZXRfcmVzdl9yZWdpb25zKCkKPiAtLSAKPiAyLjI1LjEKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFp
bGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
