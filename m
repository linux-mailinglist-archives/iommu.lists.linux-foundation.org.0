Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 931952E0397
	for <lists.iommu@lfdr.de>; Tue, 22 Dec 2020 01:55:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A2C986978;
	Tue, 22 Dec 2020 00:55:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iIf-WiktSzQ0; Tue, 22 Dec 2020 00:55:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5446686977;
	Tue, 22 Dec 2020 00:55:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 396B6C0893;
	Tue, 22 Dec 2020 00:55:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B7EAC0893
 for <iommu@lists.linux-foundation.org>; Tue, 22 Dec 2020 00:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DBDA622E96
 for <iommu@lists.linux-foundation.org>; Tue, 22 Dec 2020 00:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0EEuOenL8gn for <iommu@lists.linux-foundation.org>;
 Tue, 22 Dec 2020 00:55:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by silver.osuosl.org (Postfix) with ESMTPS id D424021080
 for <iommu@lists.linux-foundation.org>; Tue, 22 Dec 2020 00:55:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608598518; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YK/eYV9zEDRtsog1iTnXgmXquyS/SZNGMqbSGrb3cWg=;
 b=U7FCLD4uQ3sAu5MlJBfrB3cXnecusSnAm2B/LCootMdTk5eLiGp1jj6TTTcSvO/zlgmDb4S4
 Up2QHiB+4+J3WDFNoTuWryKUAGD5dRlBDk4XugBmlVNduuglyo8uRZql7YdgBAoHIn0CeELE
 QgSkmMl5MM+O1kaBOv3XiruN1rk=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fe143dfb00c0d7ad40b6c2e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 00:54:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6A759C43461; Tue, 22 Dec 2020 00:54:54 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 09C31C433CA;
 Tue, 22 Dec 2020 00:54:52 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 21 Dec 2020 16:54:52 -0800
From: isaacm@codeaurora.org
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/3] iommu/io-pgtable-arm: Prepare for modularization
In-Reply-To: <370f7c90-a3e3-57d9-1830-8abe5134e004@arm.com>
References: <1608280722-19841-1-git-send-email-isaacm@codeaurora.org>
 <1608280722-19841-2-git-send-email-isaacm@codeaurora.org>
 <309ff39d-5fc5-83c6-d423-2d66f503c60c@arm.com>
 <34ea1af8569e4115e2dd1de61ae95bb6@codeaurora.org>
 <370f7c90-a3e3-57d9-1830-8abe5134e004@arm.com>
Message-ID: <c35a517f25d88212ef4a14fdbef5f035@codeaurora.org>
X-Sender: isaacm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: kernel-team@android.com, pdaly@codeaurora.org, pratikp@codeaurora.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
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

T24gMjAyMC0xMi0yMSAwNzoyMiwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMjAtMTItMTgg
MTg6NTksIGlzYWFjbUBjb2RlYXVyb3JhLm9yZyB3cm90ZToKPj4gT24gMjAyMC0xMi0xOCAwNDoz
OCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+Pj4gT24gMjAyMC0xMi0xOCAwODozOCwgSXNhYWMgSi4g
TWFuamFycmVzIHdyb3RlOgo+Pj4+IFRoZSBpby1wZ3RhYmxlLWFybSBhbmQgaW8tcGd0YWJsZS1h
cm0tdjdzIHNvdXJjZSBmaWxlcyB3aWxsCj4+Pj4gYmUgY29tcGlsZWQgYXMgc2VwYXJhdGUgbW9k
dWxlcywgYWxvbmcgd2l0aCB0aGUgaW8tcGd0YWJsZQo+Pj4+IHNvdXJjZS4gRXhwb3J0IHRoZSBz
eW1ib2xzIGZvciB0aGUgaW8tcGd0YWJsZSBpbml0IGZ1bmN0aW9uCj4+Pj4gc3RydWN0dXJlcyBm
b3IgdGhlIGlvLXBndGFibGUgbW9kdWxlIHRvIHVzZS4KPj4+IAo+Pj4gSW4gbXkgY3VycmVudCBi
dWlsZCB0cmVlLCB0aGUgaW8tcGd0YWJsZSBnbHVlIGl0c2VsZiBpcyBhIHdob3BwaW5nIAo+Pj4g
Mzc5Cj4+PiBieXRlcyBvZiBjb2RlIGFuZCBkYXRhIC0gaXMgdGhlcmUgcmVhbGx5IGFueSBiZW5l
Zml0IHRvIGFsbCB0aGUKPj4+IGFkZGl0aW9uYWwgb3ZlcmhlYWQgb2YgbWFraW5nIHRoYXQgbW9k
dWxhcj8gR2l2ZW4gdGhlIG51bWJlciBvZgo+Pj4gZGlmZmVyZW50IHVzZXJzIChpbmNsdWRpbmcg
QU1EIG5vdyksIEkgdGhpbmsgYXQgdGhpcyBwb2ludCB3ZSBzaG91bGQKPj4+IHN0YXJ0IGNvbnNp
ZGVyaW5nIHRoaXMgYXMgcGFydCBvZiB0aGUgSU9NTVUgY29yZSwgYW5kIGp1c3QgdHdlYWsgdGhl
Cj4+PiBpbnRlcmZhY2Ugc3VjaCB0aGF0IGZvcm1hdHMgY2FuIHJlZ2lzdGVyIHRoZWlyIG93biBp
bml0X2Zucwo+Pj4gZHluYW1pY2FsbHkgaW5zdGVhZCBvZiB0aGUgc3RhdGljIGFycmF5IHRoYXQn
cyBhbHdheXMgaG9ycmlibGUuCj4+PiAKPj4+IFJvYmluLgo+Pj4gCj4+IFRoYW5rcyBmb3IgdGhl
IGZlZWRiYWNrLCBSb2Jpbi4gVGhpcyBpcyBhbiBhdmVudWUgSSBoYWQgZXhwbG9yZWQgYSBiaXQg
Cj4+IHdoZW4gbW9kdWxhcml6aW5nIHRoZSBjb2RlLiBIb3dldmVyLAo+PiBJIGNhbWUgdXAgd2l0
aCBhIGZldyBwcm9ibGVtcyB0aGF0IEkgY291bGRuJ3QgZ2V0IGFyb3VuZC4KPj4gCj4+IDEpIElm
IHdlIGxlYXZlIHRoZSBpby1wZ3RhYmxlIGdsdWUgYXMgcGFydCBvZiB0aGUgY29yZSBrZXJuZWws
IHdlIG5lZWQgCj4+IHRvIGVuc3VyZSB0aGF0IHRoZSBpby1wZ3RhYmxlIGZvcm1hdAo+PiBtb2R1
bGVzIGdldCBsb2FkZWQgcHJpb3IgdG8gYW55IGRyaXZlciB0aGF0IG1pZ2h0IHVzZSB0aGVtIChl
LmcuIElPTU1VIAo+PiBkcml2ZXJzL290aGVyIGNhbGxlcnMgb2YgYWxsb2NfaW9fcGd0YWJsZV9v
cHMpLgo+PiAgwqDCoMKgIGEpIFRoaXMgY2FuIGdldCBhIGJpdCBtZXNzeSwgYXMgdGhlcmUncyBu
byBzeW1ib2wgZGVwZW5kZW5jaWVzIAo+PiBiZXR3ZWVuIHRoZSBjYWxsZXJzIG9mIHRoZSBpby1w
Z3RhYmxlCj4+ICDCoMKgwqDCoMKgwqAgY29kZSwgYW5kIHRoZSBwYWdlIHRhYmxlIGZvcm1hdCBt
b2R1bGVzLCBzaW5jZSBldmVyeXRoaW5nIGlzIAo+PiB0aHJvdWdoIGZ1bmN0aW9uIHBvaW50ZXJz
LiBUaGlzIGlzIGhhbmRsZWQKPj4gIMKgwqDCoMKgwqDCoCBmb3IgdGhlIElPTU1VIGRyaXZlcnMg
dGhyb3VnaCB0aGUgZGV2bGluayBmZWF0dXJlLCBidXQgSSBkb24ndCAKPj4gc2VlIGhvdyB3ZSBj
YW4gbGV2ZXJhZ2Ugc29tZXRoaW5nIGxpa2UgdGhhdAo+PiAgwqDCoMKgwqDCoMKgIGhlcmUuIEkg
Z3Vlc3MgdGhpcyBpc24ndCB0b28gbXVjaCBvZiBhIHByb2JsZW0gd2hlbiBldmVyeXRoaW5nIAo+
PiBpcyBidWlsdC1pbiwgYXMgdGhlIHJlZ2lzdHJhdGlvbiBjYW4gaGFwcGVuCj4+ICDCoMKgwqDC
oMKgwqAgaW4gb25lIG9mIHRoZSBlYXJsaWVyIGluaXRjYWxsIGxldmVscy4KPj4gCj4+ICDCoMKg
wqAgYikgSWYgd2UgZG8gcnVuIGludG8gYSBzY2VuYXJpbyB3aGVyZSBhIGNsaWVudCBvZiBpby1w
Z3RhYmxlIAo+PiB0cmllcyB0byBhbGxvY2F0ZSBhIHBhZ2UgdGFibGUgaW5zdGFuY2UgcHJpb3IK
Pj4gIMKgwqDCoMKgwqDCoCB0byB0aGUgaW8tcGd0YWJsZSBmb3JtYXQgbW9kdWxlIGJlaW5nIGxv
YWRlZCwgSSBjb3VsZG4ndCBjb21lIAo+PiB1cCB3aXRoIGEgd2F5IG9mIGRpc3Rpbmd1aXNoaW5n
IGJldHdlZW4KPj4gIMKgwqDCoMKgwqDCoCBmb3JtYXQgbW9kdWxlIGlzIG5vdCBhdmFpbGFibGUg
YXQgdGhlIG1vbWVudCB2c8KgIGZvcm1hdCBtb2R1bGUgCj4+IHdpbGwgbmV2ZXIgYmUgYXZhaWxh
YmxlLiBJIGRvbid0IHRoaW5rCj4+ICDCoMKgwqDCoMKgwqAgcmV0dXJuaW5nIEVQUk9CRV9ERUZF
UiB3b3VsZCBiZSBzb21ldGhpbmcgbmljZSB0byBkbyBpbiB0aGF0IAo+PiBjYXNlLgo+IAo+IFVy
Z2gsIEkgc2VlLi4uIHllcywgdGhlIGN1cnJlbnQgYXBwcm9hY2ggZG9lcyB3b3JrIG91dCBhcyBh
bgo+IHVuZXhwZWN0ZWRseSBuZWF0IHdheSB0byBhdm9pZCBtYW55IG9mIHRoZSBwaXRmYWxscy4g
SG93ZXZlciBJJ20gbm90Cj4gc3VyZSBpdCBhY3R1YWxseSBhdm9pZHMgYWxsIG9mIHRoZW0gLSBz
YXkgeW91IGhhdmUgYSBjb25maWcgbGlrZSB0aGlzOgo+IAo+IElQTU1VX1ZNU0E9eQo+IC0+IElP
X1BHVEFCTEVfQVJNX0xQQUU9eQo+ICAgIC0+IElPX1BHVEFCTEU9eQo+IE1US19JT01NVT1tCj4g
LT4gSU9fUEdUQUJMRV9BUk1WN1M9bQo+IAo+IHdvbid0IHRoYXQgc3RpbGwgZmFpbCB0byBsaW5r
IGlvLXBndGFibGUubz8KPiAKWWVzLCB5b3UgYXJlIGNvcnJlY3QsIHRoYXQgd291bGQgYmUgcHJv
YmxlbWF0aWMuCj4+IDIpIFdlIHdvdWxkIGhhdmUgdG8gZW5zdXJlIHRoYXQgdGhlIGZvcm1hdCBt
b2R1bGUgY2Fubm90IGJlIHVubG9hZGVkIAo+PiB3aGlsZSBvdGhlciBjbGllbnRzIGFyZSB1c2lu
ZyBpdC4gSSBzdXBwb3NlCj4+IHRoaXMgaXNuJ3QgYXMgYmlnIGFzIHBvaW50ICMxIHRob3VnaCwg
c2luY2UgaXQncyBzb21ldGhpbmcgdGhhdCBjYW4gCj4+IHByb2JhYmx5IGJlIGhhbmRsZWQgdGhy
b3VnaCBhIHNpbWlsYXIgcmVmIGNvdW50Cj4+IG1lY2hhbmlzbSB0aGF0IHdlJ3JlIHVzaW5nIGZv
ciBtb2R1bGFyIElPTU1VIGRyaXZlcnMuCj4gCj4gRldJVyBJIHRoaW5rIHRoYXQgd291bGQgY29t
ZSBvdXQgaW4gdGhlIHdhc2ggZnJvbSByZXNvbHZpbmcgMWIgLSBJJ2QKPiBhc3N1bWUgdGhlcmUg
d291bGQgaGF2ZSB0byBiZSBzb21lIHNvcnQgb2YgbW9kdWxlX2dldCgpIGluIHRoZXJlCj4gc29t
ZXdoZXJlLiBJIHNob3VsZCBwcm9iYWJseSBnbyBhbmQgbG9vayBhdCBob3cgdGhlIGNyeXB0byBB
UEkgaGFuZGxlcwo+IGl0cyBtb2R1bGFyIGFsZ29yaXRobXMgZm9yIG1vcmUgaW5zcGlyYXRpb24u
Li4KU28gSSBsb29rZWQgdGhyb3VnaCB0aGUgY3J5cHRvIGRpciwgYW5kIGl0IHNlZW1zIGxpa2Ug
dGhleS0tYWxvbmcgd2l0aCBhIApmZXcgb3RoZXIga2VybmVsIGRyaXZlcnMtLWFyZSB1c2luZyBN
T0RVTEVfU09GVERFUCgpCnRvIHNvcnQgb3V0IHRoZXNlIGRlcGVuZGVuY2llcy4KPiAKPj4gR2l2
ZW4gdGhlIHR3byByZWFzb25zIGFib3ZlLCBJIHdlbnQgd2l0aCB0aGUgY3VycmVudCBhcHByb2Fj
aCwgc2luY2UgCj4+IGl0IGF2b2lkcyBib3RoIGlzc3VlcyBieSBjcmVhdGluZyBzeW1ib2wgZGVw
ZW5kZW5jaWVzCj4+IGJldHdlZW4gY2xpZW50IGRyaXZlcnMsIHRoZSBpby1wZ3RhYmxlIGRyaXZl
cnMsIGFuZCB0aGUgaW8tcGd0YWJsZSAKPj4gZm9ybWF0IGRyaXZlcnMsIHNvIHRoYXQgZW5zdXJl
cyB0aGF0IHRoZXkgYXJlIGxvYWRlZAo+PiBpbiB0aGUgY29ycmVjdCBvcmRlciwgYW5kIGFsc28g
cHJldmVudHMgdGhlbSBmcm9tIGJlaW5nIHJlbW92ZWQsIAo+PiB1bmxlc3MgdGhlcmUgYXJlbid0
IGFueSB1c2VycyBwcmVzZW50Lgo+IAo+IEhhdmluZyB0aG91Z2h0IGFsbCB0aGF0IG92ZXIsIEkn
bSBub3cgd29uZGVyaW5nIHdoYXQgd2UgcmVhbGx5IGdhaW4KPiBmcm9tIHRoaXMgZWl0aGVyIHdh
eSAtIGlmIHZlbmRvcnMgY2FuIGJ1aWxkIGFuZCBzaGlwIFNvQy10YWlsb3JlZAo+IGNvbmZpZ3Ms
IHRoZW4gdGhleSBjYW4gYWxyZWFkeSB0dXJuIG9mZiBmb3JtYXRzIHRoZXkgZG9uJ3QgY2FyZSBh
Ym91dC4KPiBJZiB0aGUgYWltIGlzIHRvIHNoaXAgYSBzaW5nbGUgY29uZmlnIGV2ZXJ5d2hlcmUs
IHRoZW4geW91J2xsIHN0aWxsCj4gaGF2ZSB0byBwcm92aXNpb24gYW5kIGxvYWQgYWxsIHBvc3Np
YmxlIGZvcm1hdHMgb24gYW55IHN5c3RlbSB0aGF0Cj4gbmVlZHMgYW55IG9uZSBvZiB0aGVtLCB0
aGFua3MgdG8gdGhvc2UgImNvbnZlbmllbnQiIHN5bWJvbAo+IGRlcGVuZGVuY2llcy4gVGhlIHBy
b21pc2UgaW4gdGhlIGNvdmVyIGxldHRlciBkb2Vzbid0IHNlZW0gdG8KPiBtYXRlcmlhbGlzZSA6
Lwo+IAo+IFJvYmluLgo+IApHaXZlbiB0aGUgZmVlZGJhY2ssIHRoaXMgbWFrZXMgc2Vuc2UuIEkn
dmUgY29tZSB1cCB3aXRoIGEgc2Vjb25kIHZlcnNpb24gCm9mIHRoZSBwYXRjaGVzIHRoYXQgbGVh
dmVzCnRoZSBpby1wZ3RhYmxlIGNvZGUgaW4gdGhlIGtlcm5lbCwgYW5kIGFsbG93cyB0aGUgZm9y
bWF0cyB0byBiZSBtb2R1bGVzLCAKd2hpY2ggYmV0dGVyIGFjaGlldmVzIHdoYXQKdGhlIGNvdmVy
LWxldHRlciBpcyB0cnlpbmcgdG8gZXhwcmVzcyA6KSBJIGJlbGlldmUgdGhhdCB3aXRoIHRoZSBz
ZWNvbmQgCnBhdGNoLCB3ZSBzaG91bGQgYmUgYWJsZSB0bwpnZXQgdG8gYSBwbGFjZSB3aGVyZSB0
aGUga2VybmVsIGp1c3QgbmVlZHMgdG8gcHJvdmlkZSBpby1wZ3RhYmxlLCB3aGlsZSAKdmVuZG9y
cyBjYW4gcHJvdmlkZSBlaXRoZXIKaW8tcGd0YWJsZS1hcm0gb3IgaW8tcGd0YWJsZS1hcm0tdjdz
IG9yIGJvdGgsIGFzIG5lZWRlZC4KSGVyZSBhcmUgdGhlIHBhdGNoZXM6IApodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1pb21tdS8xNjA4NTk3ODc2LTMyMzY3LTEtZ2l0LXNlbmQtZW1haWwt
aXNhYWNtQGNvZGVhdXJvcmEub3JnL1QvI3QKClRoYW5rcywKSXNhYWMKPj4gCj4+IFRoYW5rcywK
Pj4gSXNhYWMKPj4+PiBTaWduZWQtb2ZmLWJ5OiBJc2FhYyBKLiBNYW5qYXJyZXMgPGlzYWFjbUBj
b2RlYXVyb3JhLm9yZz4KPj4+PiAtLS0KPj4+PiDCoCBkcml2ZXJzL2lvbW11L2lvLXBndGFibGUt
YXJtLXY3cy5jIHwgNCArKysrCj4+Pj4gwqAgZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5j
wqDCoMKgwqAgfCA4ICsrKysrKysrCj4+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspCj4+Pj4gCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1h
cm0tdjdzLmMgCj4+Pj4gYi9kcml2ZXJzL2lvbW11L2lvLXBndGFibGUtYXJtLXY3cy5jCj4+Pj4g
aW5kZXggMWQ5MmFjOS4uZjA2MmMxYyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2lv
LXBndGFibGUtYXJtLXY3cy5jCj4+Pj4gKysrIGIvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFy
bS12N3MuYwo+Pj4+IEBAIC0yOCw2ICsyOCw3IEBACj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L2lv
bW11Lmg+Cj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+Pj4+IMKgICNpbmNsdWRl
IDxsaW51eC9rbWVtbGVhay5oPgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+Pj4g
wqAgI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+Cj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3NsYWIu
aD4KPj4+PiDCoCAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KPj4+PiBAQCAtODM5LDYgKzg0
MCw3IEBAIHN0cnVjdCBpb19wZ3RhYmxlX2luaXRfZm5zIAo+Pj4+IGlvX3BndGFibGVfYXJtX3Y3
c19pbml0X2ZucyA9IHsKPj4+PiDCoMKgwqDCoMKgIC5hbGxvY8KgwqDCoCA9IGFybV92N3NfYWxs
b2NfcGd0YWJsZSwKPj4+PiDCoMKgwqDCoMKgIC5mcmVlwqDCoMKgID0gYXJtX3Y3c19mcmVlX3Bn
dGFibGUsCj4+Pj4gwqAgfTsKPj4+PiArRVhQT1JUX1NZTUJPTF9HUEwoaW9fcGd0YWJsZV9hcm1f
djdzX2luaXRfZm5zKTsKPj4+PiDCoMKgwqAgI2lmZGVmIENPTkZJR19JT01NVV9JT19QR1RBQkxF
X0FSTVY3U19TRUxGVEVTVAo+Pj4+IMKgIEBAIC05ODQsMyArOTg2LDUgQEAgc3RhdGljIGludCBf
X2luaXQgYXJtX3Y3c19kb19zZWxmdGVzdHModm9pZCkKPj4+PiDCoCB9Cj4+Pj4gwqAgc3Vic3lz
X2luaXRjYWxsKGFybV92N3NfZG9fc2VsZnRlc3RzKTsKPj4+PiDCoCAjZW5kaWYKPj4+PiArCj4+
Pj4gK01PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsKPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
b21tdS9pby1wZ3RhYmxlLWFybS5jIAo+Pj4+IGIvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFy
bS5jCj4+Pj4gaW5kZXggODdkZWY1OC4uMjYyM2Q1NyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJz
L2lvbW11L2lvLXBndGFibGUtYXJtLmMKPj4+PiArKysgYi9kcml2ZXJzL2lvbW11L2lvLXBndGFi
bGUtYXJtLmMKPj4+PiBAQCAtMTMsNiArMTMsNyBAQAo+Pj4+IMKgICNpbmNsdWRlIDxsaW51eC9i
aXRvcHMuaD4KPj4+PiDCoCAjaW5jbHVkZSA8bGludXgvaW8tcGd0YWJsZS5oPgo+Pj4+IMKgICNp
bmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPj4+PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+
Pj4+IMKgICNpbmNsdWRlIDxsaW51eC9zaXplcy5oPgo+Pj4+IMKgICNpbmNsdWRlIDxsaW51eC9z
bGFiLmg+Cj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4+Pj4gQEAgLTEwNDcsMjYg
KzEwNDgsMzEgQEAgc3RydWN0IGlvX3BndGFibGVfaW5pdF9mbnMgCj4+Pj4gaW9fcGd0YWJsZV9h
cm1fNjRfbHBhZV9zMV9pbml0X2ZucyA9IHsKPj4+PiDCoMKgwqDCoMKgIC5hbGxvY8KgwqDCoCA9
IGFybV82NF9scGFlX2FsbG9jX3BndGFibGVfczEsCj4+Pj4gwqDCoMKgwqDCoCAuZnJlZcKgwqDC
oCA9IGFybV9scGFlX2ZyZWVfcGd0YWJsZSwKPj4+PiDCoCB9Owo+Pj4+ICtFWFBPUlRfU1lNQk9M
X0dQTChpb19wZ3RhYmxlX2FybV82NF9scGFlX3MxX2luaXRfZm5zKTsKPj4+PiDCoMKgwqAgc3Ry
dWN0IGlvX3BndGFibGVfaW5pdF9mbnMgaW9fcGd0YWJsZV9hcm1fNjRfbHBhZV9zMl9pbml0X2Zu
cyA9IAo+Pj4+IHsKPj4+PiDCoMKgwqDCoMKgIC5hbGxvY8KgwqDCoCA9IGFybV82NF9scGFlX2Fs
bG9jX3BndGFibGVfczIsCj4+Pj4gwqDCoMKgwqDCoCAuZnJlZcKgwqDCoCA9IGFybV9scGFlX2Zy
ZWVfcGd0YWJsZSwKPj4+PiDCoCB9Owo+Pj4+ICtFWFBPUlRfU1lNQk9MX0dQTChpb19wZ3RhYmxl
X2FybV82NF9scGFlX3MyX2luaXRfZm5zKTsKPj4+PiDCoMKgwqAgc3RydWN0IGlvX3BndGFibGVf
aW5pdF9mbnMgaW9fcGd0YWJsZV9hcm1fMzJfbHBhZV9zMV9pbml0X2ZucyA9IAo+Pj4+IHsKPj4+
PiDCoMKgwqDCoMKgIC5hbGxvY8KgwqDCoCA9IGFybV8zMl9scGFlX2FsbG9jX3BndGFibGVfczEs
Cj4+Pj4gwqDCoMKgwqDCoCAuZnJlZcKgwqDCoCA9IGFybV9scGFlX2ZyZWVfcGd0YWJsZSwKPj4+
PiDCoCB9Owo+Pj4+ICtFWFBPUlRfU1lNQk9MX0dQTChpb19wZ3RhYmxlX2FybV8zMl9scGFlX3Mx
X2luaXRfZm5zKTsKPj4+PiDCoMKgwqAgc3RydWN0IGlvX3BndGFibGVfaW5pdF9mbnMgaW9fcGd0
YWJsZV9hcm1fMzJfbHBhZV9zMl9pbml0X2ZucyA9IAo+Pj4+IHsKPj4+PiDCoMKgwqDCoMKgIC5h
bGxvY8KgwqDCoCA9IGFybV8zMl9scGFlX2FsbG9jX3BndGFibGVfczIsCj4+Pj4gwqDCoMKgwqDC
oCAuZnJlZcKgwqDCoCA9IGFybV9scGFlX2ZyZWVfcGd0YWJsZSwKPj4+PiDCoCB9Owo+Pj4+ICtF
WFBPUlRfU1lNQk9MX0dQTChpb19wZ3RhYmxlX2FybV8zMl9scGFlX3MyX2luaXRfZm5zKTsKPj4+
PiDCoMKgwqAgc3RydWN0IGlvX3BndGFibGVfaW5pdF9mbnMgaW9fcGd0YWJsZV9hcm1fbWFsaV9s
cGFlX2luaXRfZm5zID0gewo+Pj4+IMKgwqDCoMKgwqAgLmFsbG9jwqDCoMKgID0gYXJtX21hbGlf
bHBhZV9hbGxvY19wZ3RhYmxlLAo+Pj4+IMKgwqDCoMKgwqAgLmZyZWXCoMKgwqAgPSBhcm1fbHBh
ZV9mcmVlX3BndGFibGUsCj4+Pj4gwqAgfTsKPj4+PiArRVhQT1JUX1NZTUJPTF9HUEwoaW9fcGd0
YWJsZV9hcm1fbWFsaV9scGFlX2luaXRfZm5zKTsKPj4+PiDCoMKgwqAgI2lmZGVmIENPTkZJR19J
T01NVV9JT19QR1RBQkxFX0xQQUVfU0VMRlRFU1QKPj4+PiDCoCBAQCAtMTI1MiwzICsxMjU4LDUg
QEAgc3RhdGljIGludCBfX2luaXQgCj4+Pj4gYXJtX2xwYWVfZG9fc2VsZnRlc3RzKHZvaWQpCj4+
Pj4gwqAgfQo+Pj4+IMKgIHN1YnN5c19pbml0Y2FsbChhcm1fbHBhZV9kb19zZWxmdGVzdHMpOwo+
Pj4+IMKgICNlbmRpZgo+Pj4+ICsKPj4+PiArTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOwo+Pj4+
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBt
YWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
