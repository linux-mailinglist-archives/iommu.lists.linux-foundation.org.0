Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3275748
	for <lists.iommu@lfdr.de>; Thu, 25 Jul 2019 20:53:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 951DEC6A;
	Thu, 25 Jul 2019 18:53:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B70DCDCA
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 17:31:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8AFCFB0
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 17:31:10 +0000 (UTC)
Received: from [IPv6:2a02:810a:113f:a6c2::355a] (unknown
	[IPv6:2a02:810a:113f:a6c2::355a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: dafna)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CF5E128BC07;
	Thu, 25 Jul 2019 18:31:07 +0100 (BST)
Message-ID: <1564075865.2339.6.camel@collabora.com>
Subject: Re: [PATCH v3 1/2] dma-contiguous: Abstract
	dma_{alloc,free}_contiguous()
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>, Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>
Date: Thu, 25 Jul 2019 19:31:05 +0200
In-Reply-To: <20190725165015.GA31961@Asurada-Nvidia.nvidia.com>
References: <20190524040633.16854-1-nicoleotsuka@gmail.com>
	<20190524040633.16854-2-nicoleotsuka@gmail.com>
	<CAAEAJfA+edVLfZzEZe98249Y7NZQFht9185JH21pV10Bq9Wk3w@mail.gmail.com>
	<20190725165015.GA31961@Asurada-Nvidia.nvidia.com>
Organization: Collabora
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Thu, 25 Jul 2019 18:53:12 +0000
Cc: Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, jcmvbkbc@gmail.com,
	hch@lst.de, sfr@canb.auug.org.au, dann.frazier@canonical.com,
	Russell King <linux@armlinux.org.uk>, hans.verkuil@cisco.com,
	treding@nvidia.com, linux-media@vger.kernel.org,
	linux-xtensa@linux-xtensa.org, keescook@chromium.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	chris@zankel.net, wsa+renesas@sang-engineering.com, robin.murphy@arm.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org, iamjoonsoo.kim@lge.com,
	David Woodhouse <dwmw2@infradead.org>
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

T24gVGh1LCAyMDE5LTA3LTI1IGF0IDA5OjUwIC0wNzAwLCBOaWNvbGluIENoZW4gd3JvdGU6Cj4g
T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDE6MDY6NDJQTSAtMDMwMCwgRXplcXVpZWwgR2FyY2lh
IHdyb3RlOgo+ID4gSSBjYW4ndCBmaW5kIGEgd2F5IHRvIGZvcndhcmQtcmVkaXJlY3QgZnJvbSBH
bWFpbCwgc28gSSdtIENjaW5nIERhZm5hCj4gPiB3aG8gZm91bmQgYSByZWdyZXNzaW9uIGNhdXNl
ZCBieSB0aGlzIGNvbW1pdC4gRGFmbmEsIGNhbiB5b3UgZ2l2ZSBhbGwKPiA+IHRoZSBkZXRhaWxz
LCBpbmNsdWRpbmcgdGhlIGxvZyBhbmQgaG93IHlvdSBhcmUgcmVwcm9kdWNpbmcgaXQ/Cj4gCj4g
SSBzYXcgdGhlIGNvbnZlcnNhdGlvbiB0aGVyZS4gU29ycnkgZm9yIG5vdCByZXBseWluZyB5ZXQu
Cj4gTWF5IHdlIGRpc2N1c3MgdGhlcmUgc2luY2UgdGhlcmUgYXJlIGZ1bGwgbG9ncyBhdmFpbGFi
bGU/Cj4gCj4gVGhhbmtzCj4gTmljb2xpbgo+IAoKSGksCkkgY29tcGlsZWQgdml2aWQgYXMgYnVp
bHQtaW4gaW50byB0aGUga2VybmVsIChub3QgYXMgYSBzZXBhcmF0ZSBtb2R1bGUpIGZvciBuaXRy
b2dlbjhtIGRldmljZSAoaW14OCkgYW5kCnNldCBpdCB0byB1c2UgY29udGlnIGRtYSBmb3IgbWVt
X29wcyBieSBhZGRpbmcgdGhlIGtlcm5lbCBwYXJhbQp2aXZpZC5hbGxvY2F0b3JzPTEsMSwuLi4K
CkkgdXNlIHRoaXMgZGV2aWNldHJlZSBwYXRjaCBmb3IgdGhlIGR0YiBmaWxlOiBodHRwczovL2xr
bWwub3JnL2xrbWwvMjAxOS83LzI0Lzc4OS4gQWx0aG91Z2ggaXQgc2hvdWxkCmJlIHRoZSBzYW1l
IG9uIGFueSBBYXJjaDY0IHBsYXRmb3JtLgoKVGhlbiwgb24gdGhlIGJvYXJkIEkgcnVuIHRoZSBj
b21tYW5kOgoKdjRsMi1jdGwgLWQzIC12IHdpZHRoPTI1OTIsaGVpZ2h0PTE5NDQscGl4ZWxmb3Jt
YXQ9VVlWWSxieXRlc3BlcmxpbmU9NTE4NCAtLXN0cmVhbS1tbWFwIC0tc3RyZWFtLXRvIHZpZGVv
LlVZVlkKCkluIGV2ZXJ5IHJ1biB0aGVyZSBpcyBhIGRpZmZlcmVudCBjcmFzaC4gSGVyZSBpcyBv
bmUgb2YgdGhlbTogaHR0cHM6Ly9wYXN0ZWJpbi5jb20veFhnYlhNQU4KCkRhZm5hCj4gPiAKPiA+
IAo+ID4gPiA+IE9uIEZyaSwgMjQgTWF5IDIwMTkgYXQgMDE6MDgsIE5pY29saW4gQ2hlbiA8bmlj
b2xlb3RzdWthQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+IAo+ID4gPiBCb3RoIGRtYV9hbGxvY19m
cm9tX2NvbnRpZ3VvdXMoKSBhbmQgZG1hX3JlbGVhc2VfZnJvbV9jb250aWd1b3VzKCkKPiA+ID4g
YXJlIHZlcnkgc2ltcGx5IGltcGxlbWVudGVkLCBidXQgcmVxdWlyaW5nIGNhbGxlcnMgdG8gcGFz
cyBjZXJ0YWluCj4gPiA+IHBhcmFtZXRlcnMgbGlrZSBjb3VudCBhbmQgYWxpZ24sIGFuZCB0YWtp
bmcgYSBib29sZWFuIHBhcmFtZXRlciB0bwo+ID4gPiBjaGVjayBfX0dGUF9OT1dBUk4gaW4gdGhl
IGFsbG9jYXRpb24gZmxhZ3MuIFNvIGV2ZXJ5IGZ1bmN0aW9uIGNhbGwKPiA+ID4gZHVwbGljYXRl
cyBzaW1pbGFyIHdvcms6Cj4gPiA+IMKgIC8qIEEgcGllY2Ugb2YgZXhhbXBsZSAqLwo+ID4gPiDC
oCB1bnNpZ25lZCBsb25nIG9yZGVyID0gZ2V0X29yZGVyKHNpemUpOwo+ID4gPiDCoCBzaXplX3Qg
Y291bnQgPSBzaXplID4+IFBBR0VfU0hJRlQ7Cj4gPiA+IMKgIHBhZ2UgPSBkbWFfYWxsb2NfZnJv
bV9jb250aWd1b3VzKGRldiwgY291bnQsIG9yZGVyLCBnZnAgJiBfX0dGUF9OT1dBUk4pOwo+ID4g
PiDCoCBbLi4uXQo+ID4gPiDCoCBkbWFfcmVsZWFzZV9mcm9tX2NvbnRpZ3VvdXMoZGV2LCBwYWdl
LCBzaXplID4+IFBBR0VfU0hJRlQpOwo+ID4gPiAKPiA+ID4gQWRkaXRpb25hbGx5LCBhcyBDTUEg
Y2FuIGJlIHVzZWQgb25seSBpbiB0aGUgY29udGV4dCB3aGljaCBwZXJtaXRzCj4gPiA+IHNsZWVw
aW5nLCBtb3N0IG9mIGNhbGxlcnMgZG8gYSBnZnBmbGFnc19hbGxvd19ibG9ja2luZygpIGNoZWNr
IGFuZAo+ID4gPiBhIGNvcnJlc3BvbmRpbmcgZmFsbGJhY2sgYWxsb2NhdGlvbiBvZiBub3JtYWwg
cGFnZXMgdXBvbiBhbnkgZmFsc2UKPiA+ID4gcmVzdWx0Ogo+ID4gPiDCoCAvKiBBIHBpZWNlIG9m
IGV4YW1wbGUgKi8KPiA+ID4gwqAgaWYgKGdmcGZsYWdzX2FsbG93X2Jsb2NraW5nKGZsYWcpKQo+
ID4gPiDCoMKgwqDCoMKgwqBwYWdlID0gZG1hX2FsbG9jX2Zyb21fY29udGlndW91cygpOwo+ID4g
PiDCoCBpZiAoIXBhZ2UpCj4gPiA+IMKgwqDCoMKgwqDCoHBhZ2UgPSBhbGxvY19wYWdlcygpOwo+
ID4gPiDCoCBbLi4uXQo+ID4gPiDCoCBpZiAoIWRtYV9yZWxlYXNlX2Zyb21fY29udGlndW91cyhk
ZXYsIHBhZ2UsIGNvdW50KSkKPiA+ID4gwqDCoMKgwqDCoMKgX19mcmVlX3BhZ2VzKHBhZ2UsIGdl
dF9vcmRlcihzaXplKSk7Cj4gPiA+IAo+ID4gPiBTbyB0aGlzIHBhdGNoIHNpbXBsaWZpZXMgdGhv
c2UgZnVuY3Rpb24gY2FsbHMgYnkgYWJzdHJhY3RpbmcgdGhlc2UKPiA+ID4gb3BlcmF0aW9ucyBp
bnRvIHRoZSB0d28gbmV3IGZ1bmN0aW9uczogZG1hX3thbGxvYyxmcmVlfV9jb250aWd1b3VzLgo+
ID4gPiAKPiA+ID4gQXMgc29tZSBjYWxsZXJzIG9mIGRtYV97YWxsb2MscmVsZWFzZX1fZnJvbV9j
b250aWd1b3VzKCkgbWlnaHQgYmUKPiA+ID4gY29tcGxpY2F0ZWQsIHRoaXMgcGF0Y2gganVzdCBp
bXBsZW1lbnRzIHRoZXNlIHR3byBuZXcgZnVuY3Rpb25zIHRvCj4gPiA+IGtlcm5lbC9kbWEvZGly
ZWN0LmMgb25seSBhcyBhbiBpbml0aWFsIHN0ZXAuCj4gPiA+IAo+ID4gPiA+ID4gPiBTdWdnZXN0
ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+ID4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBOaWNvbGluIENoZW4gPG5pY29sZW90c3VrYUBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+
ID4gPiBDaGFuZ2Vsb2cKPiA+ID4gdjItPnYzOgo+ID4gPiDCoCogQWRkZWQgbWlzc2luZyAic3Rh
dGljIGlubGluZSIgaW4gaGVhZGVyIGZpbGUgdG8gZml4IGJ1aWxkIGVycm9yLgo+ID4gPiB2MS0+
djI6Cj4gPiA+IMKgKiBBZGRlZCBuZXcgZnVuY3Rpb25zIGJlc2lkZSB0aGUgb2xkIG9uZXMgc28g
d2UgY2FuIHJlcGxhY2UgY2FsbGVycwo+ID4gPiDCoMKgwqBvbmUgYnkgb25lIGxhdGVyLgo+ID4g
PiDCoCogQXBwbGllZCBuZXcgZnVuY3Rpb25zIHRvIGRtYS9kaXJlY3QuYyBvbmx5LCBiZWNhdXNl
IGl0J3MgdGhlIGJlc3QKPiA+ID4gwqDCoMKgZXhhbXBsZSBjYWxsZXIgdG8gYXBwbHkgYW5kIHNo
b3VsZCBiZSBzYWZlIHdpdGggdGhlIG5ldyBmdW5jdGlvbnMuCj4gPiA+IAo+ID4gPiDCoGluY2x1
ZGUvbGludXgvZG1hLWNvbnRpZ3VvdXMuaCB8IDExICsrKysrKysrCj4gPiA+IMKga2VybmVsL2Rt
YS9jb250aWd1b3VzLmPCoMKgwqDCoMKgwqDCoMKgfCA0OCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gPiA+IMKga2VybmVsL2RtYS9kaXJlY3QuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHwgMjQgKysrLS0tLS0tLS0tLS0tLS0KPiA+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDYz
IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvZG1hLWNvbnRpZ3VvdXMuaCBiL2luY2x1ZGUvbGludXgvZG1hLWNvbnRp
Z3VvdXMuaAo+ID4gPiBpbmRleCBmMjQ3ZThhYTVlM2QuLjAwYTM3MGMxYzE0MCAxMDA2NDQKPiA+
ID4gLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtY29udGlndW91cy5oCj4gPiA+ICsrKyBiL2luY2x1
ZGUvbGludXgvZG1hLWNvbnRpZ3VvdXMuaAo+ID4gPiBAQCAtMTE1LDYgKzExNSw4IEBAIHN0cnVj
dCBwYWdlICpkbWFfYWxsb2NfZnJvbV9jb250aWd1b3VzKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6
ZV90IGNvdW50LAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBpbnQgb3JkZXIs
IGJvb2wgbm9fd2Fybik7Cj4gPiA+IMKgYm9vbCBkbWFfcmVsZWFzZV9mcm9tX2NvbnRpZ3VvdXMo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcGFnZSAqcGFnZXMsCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlu
dCBjb3VudCk7Cj4gPiA+ICtzdHJ1Y3QgcGFnZSAqZG1hX2FsbG9jX2NvbnRpZ3VvdXMoc3RydWN0
IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwgZ2ZwX3QgZ2ZwKTsKPiA+ID4gK3ZvaWQgZG1hX2Zy
ZWVfY29udGlndW91cyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwYWdlICpwYWdlLCBzaXpl
X3Qgc2l6ZSk7Cj4gPiA+IAo+ID4gPiDCoCNlbHNlCj4gPiA+IAo+ID4gPiBAQCAtMTU3LDYgKzE1
OSwxNSBAQCBib29sIGRtYV9yZWxlYXNlX2Zyb21fY29udGlndW91cyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBwYWdlICpwYWdlcywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxz
ZTsKPiA+ID4gwqB9Cj4gPiA+IAo+ID4gPiArc3RhdGljIGlubGluZQo+ID4gPiArc3RydWN0IHBh
Z2UgKmRtYV9hbGxvY19jb250aWd1b3VzKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNpemUs
IGdmcF90IGdmcCkKPiA+ID4gK3sKPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIE5VTEw7Cj4g
PiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbmxpbmUKPiA+ID4gK3ZvaWQgZG1hX2ZyZWVf
Y29udGlndW91cyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwYWdlICpwYWdlLCBzaXplX3Qg
c2l6ZSkgeyB9Cj4gPiA+ICsKPiA+ID4gwqAjZW5kaWYKPiA+ID4gCj4gPiA+IMKgI2VuZGlmCj4g
PiA+IGRpZmYgLS1naXQgYS9rZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYyBiL2tlcm5lbC9kbWEvY29u
dGlndW91cy5jCj4gPiA+IGluZGV4IGIyYTg3OTA1ODQ2ZC4uMjFmMzlhNmNiMDRmIDEwMDY0NAo+
ID4gPiAtLS0gYS9rZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYwo+ID4gPiArKysgYi9rZXJuZWwvZG1h
L2NvbnRpZ3VvdXMuYwo+ID4gPiBAQCAtMjE0LDYgKzIxNCw1NCBAQCBib29sIGRtYV9yZWxlYXNl
X2Zyb21fY29udGlndW91cyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwYWdlICpwYWdlcywK
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBjbWFfcmVsZWFzZShkZXZfZ2V0X2NtYV9hcmVh
KGRldiksIHBhZ2VzLCBjb3VudCk7Cj4gPiA+IMKgfQo+ID4gPiAKPiA+ID4gKy8qKgo+ID4gPiAr
ICogZG1hX2FsbG9jX2NvbnRpZ3VvdXMoKSAtIGFsbG9jYXRlIGNvbnRpZ3VvdXMgcGFnZXMKPiA+
ID4gKyAqIEBkZXY6wqDCoMKgUG9pbnRlciB0byBkZXZpY2UgZm9yIHdoaWNoIHRoZSBhbGxvY2F0
aW9uIGlzIHBlcmZvcm1lZC4KPiA+ID4gKyAqIEBzaXplOsKgwqBSZXF1ZXN0ZWQgYWxsb2NhdGlv
biBzaXplLgo+ID4gPiArICogQGdmcDrCoMKgwqBBbGxvY2F0aW9uIGZsYWdzLgo+ID4gPiArICoK
PiA+ID4gKyAqIFRoaXMgZnVuY3Rpb24gYWxsb2NhdGVzIGNvbnRpZ3VvdXMgbWVtb3J5IGJ1ZmZl
ciBmb3Igc3BlY2lmaWVkIGRldmljZS4gSXQKPiA+ID4gKyAqIGZpcnN0IHRyaWVzIHRvIHVzZSBk
ZXZpY2Ugc3BlY2lmaWMgY29udGlndW91cyBtZW1vcnkgYXJlYSBpZiBhdmFpbGFibGUgb3IKPiA+
ID4gKyAqIHRoZSBkZWZhdWx0IGdsb2JhbCBvbmUsIHRoZW4gdHJpZXMgYSBmYWxsYmFjayBhbGxv
Y2F0aW9uIG9mIG5vcm1hbCBwYWdlcy4KPiA+ID4gKyAqLwo+ID4gPiArc3RydWN0IHBhZ2UgKmRt
YV9hbGxvY19jb250aWd1b3VzKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNpemUsIGdmcF90
IGdmcCkKPiA+ID4gK3sKPiA+ID4gK8KgwqDCoMKgwqDCoMKgaW50IG5vZGUgPSBkZXYgPyBkZXZf
dG9fbm9kZShkZXYpIDogTlVNQV9OT19OT0RFOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBzaXplX3Qg
Y291bnQgPSBQQUdFX0FMSUdOKHNpemUpID4+IFBBR0VfU0hJRlQ7Cj4gPiA+ICvCoMKgwqDCoMKg
wqDCoHNpemVfdCBhbGlnbiA9IGdldF9vcmRlcihQQUdFX0FMSUdOKHNpemUpKTsKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgc3RydWN0IGNtYSAqY21hID0gZGV2X2dldF9jbWFfYXJlYShkZXYpOwo+ID4g
PiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcGFnZSAqcGFnZSA9IE5VTEw7Cj4gPiA+ICsKPiA+ID4g
K8KgwqDCoMKgwqDCoMKgLyogQ01BIGNhbiBiZSB1c2VkIG9ubHkgaW4gdGhlIGNvbnRleHQgd2hp
Y2ggcGVybWl0cyBzbGVlcGluZyAqLwo+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoY21hICYmIGdm
cGZsYWdzX2FsbG93X2Jsb2NraW5nKGdmcCkpIHsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGFsaWduID0gbWluX3Qoc2l6ZV90LCBhbGlnbiwgQ09ORklHX0NNQV9BTElHTk1F
TlQpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGFnZSA9IGNtYV9hbGxv
YyhjbWEsIGNvdW50LCBhbGlnbiwgZ2ZwICYgX19HRlBfTk9XQVJOKTsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgfQo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoC8qIEZhbGxiYWNrIGFsbG9jYXRp
b24gb2Ygbm9ybWFsIHBhZ2VzICovCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghcGFnZSkKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBhZ2UgPSBhbGxvY19wYWdlc19ub2Rl
KG5vZGUsIGdmcCwgYWxpZ24pOwo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBw
YWdlOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICsvKioKPiA+ID4gKyAqIGRtYV9mcmVlX2NvbnRp
Z3VvdXMoKSAtIHJlbGVhc2UgYWxsb2NhdGVkIHBhZ2VzCj4gPiA+ICsgKiBAZGV2OsKgwqDCoFBv
aW50ZXIgdG8gZGV2aWNlIGZvciB3aGljaCB0aGUgcGFnZXMgd2VyZSBhbGxvY2F0ZWQuCj4gPiA+
ICsgKiBAcGFnZTrCoMKgUG9pbnRlciB0byB0aGUgYWxsb2NhdGVkIHBhZ2VzLgo+ID4gPiArICog
QHNpemU6wqDCoFNpemUgb2YgYWxsb2NhdGVkIHBhZ2VzLgo+ID4gPiArICoKPiA+ID4gKyAqIFRo
aXMgZnVuY3Rpb24gcmVsZWFzZXMgbWVtb3J5IGFsbG9jYXRlZCBieSBkbWFfYWxsb2NfY29udGln
dW91cygpLiBBcyB0aGUKPiA+ID4gKyAqIGNtYV9yZWxlYXNlIHJldHVybnMgZmFsc2Ugd2hlbiBw
cm92aWRlZCBwYWdlcyBkbyBub3QgYmVsb25nIHRvIGNvbnRpZ3VvdXMKPiA+ID4gKyAqIGFyZWEg
YW5kIHRydWUgb3RoZXJ3aXNlLCB0aGlzIGZ1bmN0aW9uIHRoZW4gZG9lcyBhIGZhbGxiYWNrIF9f
ZnJlZV9wYWdlcygpCj4gPiA+ICsgKiB1cG9uIGEgZmFsc2UtcmV0dXJuLgo+ID4gPiArICovCj4g
PiA+ICt2b2lkIGRtYV9mcmVlX2NvbnRpZ3VvdXMoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qg
cGFnZSAqcGFnZSwgc2l6ZV90IHNpemUpCj4gPiA+ICt7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlm
ICghY21hX3JlbGVhc2UoZGV2X2dldF9jbWFfYXJlYShkZXYpLCBwYWdlLCBzaXplID4+IFBBR0Vf
U0hJRlQpKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX19mcmVlX3BhZ2Vz
KHBhZ2UsIGdldF9vcmRlcihzaXplKSk7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gwqAvKgo+ID4g
PiDCoCAqIFN1cHBvcnQgZm9yIHJlc2VydmVkIG1lbW9yeSByZWdpb25zIGRlZmluZWQgaW4gZGV2
aWNlIHRyZWUKPiA+ID4gwqAgKi8KPiA+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9kbWEvZGlyZWN0
LmMgYi9rZXJuZWwvZG1hL2RpcmVjdC5jCj4gPiA+IGluZGV4IDJjMjc3MmU5NzAyYS4uMDgxNmMx
ZThiMDVhIDEwMDY0NAo+ID4gPiAtLS0gYS9rZXJuZWwvZG1hL2RpcmVjdC5jCj4gPiA+ICsrKyBi
L2tlcm5lbC9kbWEvZGlyZWN0LmMKPiA+ID4gQEAgLTk2LDggKzk2LDYgQEAgc3RhdGljIGJvb2wg
ZG1hX2NvaGVyZW50X29rKHN0cnVjdCBkZXZpY2UgKmRldiwgcGh5c19hZGRyX3QgcGh5cywgc2l6
ZV90IHNpemUpCj4gPiA+IMKgc3RydWN0IHBhZ2UgKl9fZG1hX2RpcmVjdF9hbGxvY19wYWdlcyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGRtYV9hZGRyX3QgKmRtYV9oYW5kbGUsIGdmcF90IGdmcCwgdW5zaWduZWQg
bG9uZyBhdHRycykKPiA+ID4gwqB7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGludCBj
b3VudCA9IFBBR0VfQUxJR04oc2l6ZSkgPj4gUEFHRV9TSElGVDsKPiA+ID4gLcKgwqDCoMKgwqDC
oMKgaW50IHBhZ2Vfb3JkZXIgPSBnZXRfb3JkZXIoc2l6ZSk7Cj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgcGFnZSAqcGFnZSA9IE5VTEw7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB1NjQgcGh5
c19tYXNrOwo+ID4gPiAKPiA+ID4gQEAgLTEwOSwyMCArMTA3LDkgQEAgc3RydWN0IHBhZ2UgKl9f
ZG1hX2RpcmVjdF9hbGxvY19wYWdlcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLAo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgZ2ZwIHw9IF9fZG1hX2RpcmVjdF9vcHRpbWFsX2dmcF9tYXNr
KGRldiwgZGV2LT5jb2hlcmVudF9kbWFfbWFzaywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgJnBoeXNfbWFzayk7Cj4gPiA+IMKgYWdhaW46Cj4g
PiA+IC3CoMKgwqDCoMKgwqDCoC8qIENNQSBjYW4gYmUgdXNlZCBvbmx5IGluIHRoZSBjb250ZXh0
IHdoaWNoIHBlcm1pdHMgc2xlZXBpbmcgKi8KPiA+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKGdmcGZs
YWdzX2FsbG93X2Jsb2NraW5nKGdmcCkpIHsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHBhZ2UgPSBkbWFfYWxsb2NfZnJvbV9jb250aWd1b3VzKGRldiwgY291bnQsIHBhZ2Vf
b3JkZXIsCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnZnAg
JiBfX0dGUF9OT1dBUk4pOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYg
KHBhZ2UgJiYgIWRtYV9jb2hlcmVudF9vayhkZXYsIHBhZ2VfdG9fcGh5cyhwYWdlKSwgc2l6ZSkp
IHsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBk
bWFfcmVsZWFzZV9mcm9tX2NvbnRpZ3VvdXMoZGV2LCBwYWdlLCBjb3VudCk7Cj4gPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGFnZSA9IE5VTEw7Cj4g
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiA+IC3CoMKgwqDCoMKgwqDC
oH0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKCFwYWdlKQo+ID4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcGFnZSA9IGFsbG9jX3BhZ2VzX25vZGUoZGV2X3RvX25vZGUoZGV2KSwg
Z2ZwLCBwYWdlX29yZGVyKTsKPiA+ID4gLQo+ID4gPiArwqDCoMKgwqDCoMKgwqBwYWdlID0gZG1h
X2FsbG9jX2NvbnRpZ3VvdXMoZGV2LCBzaXplLCBnZnApOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
aWYgKHBhZ2UgJiYgIWRtYV9jb2hlcmVudF9vayhkZXYsIHBhZ2VfdG9fcGh5cyhwYWdlKSwgc2l6
ZSkpIHsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9fZnJlZV9wYWdlcyhw
YWdlLCBwYWdlX29yZGVyKTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRt
YV9mcmVlX2NvbnRpZ3VvdXMoZGV2LCBwYWdlLCBzaXplKTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBwYWdlID0gTlVMTDsKPiA+ID4gCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaWYgKElTX0VOQUJMRUQoQ09ORklHX1pPTkVfRE1BMzIpICYmCj4g
PiA+IEBAIC0xNTQsNyArMTQxLDcgQEAgdm9pZCAqZG1hX2RpcmVjdF9hbGxvY19wYWdlcyhzdHJ1
Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKFBh
Z2VIaWdoTWVtKHBhZ2UpKSB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LyoKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCogRGVwZW5kaW5nIG9u
IHRoZSBjbWE9IGFyZ3VtZW50cyBhbmQgcGVyLWFyY2ggc2V0dXAKPiA+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgKiBkbWFfYWxsb2NfZnJvbV9jb250aWd1b3VzIGNvdWxkIHJl
dHVybiBoaWdobWVtIHBhZ2VzLgo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAqIGRtYV9hbGxvY19jb250aWd1b3VzIGNvdWxkIHJldHVybiBoaWdobWVtIHBhZ2VzLgo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKiBXaXRob3V0IHJlbWFwcGluZyB0
aGVyZSBpcyBubyB3YXkgdG8gcmV0dXJuIHRoZW0gaGVyZSwKPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCogc28gbG9nIGFuIGVycm9yIGFuZCBmYWlsLgo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKi8KPiA+ID4gQEAgLTE3NiwxMCArMTYzLDcg
QEAgdm9pZCAqZG1hX2RpcmVjdF9hbGxvY19wYWdlcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVf
dCBzaXplLAo+ID4gPiAKPiA+ID4gwqB2b2lkIF9fZG1hX2RpcmVjdF9mcmVlX3BhZ2VzKHN0cnVj
dCBkZXZpY2UgKmRldiwgc2l6ZV90IHNpemUsIHN0cnVjdCBwYWdlICpwYWdlKQo+ID4gPiDCoHsK
PiA+ID4gLcKgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50IGNvdW50ID0gUEFHRV9BTElHTihzaXpl
KSA+PiBQQUdFX1NISUZUOwo+ID4gPiAtCj4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmICghZG1hX3Jl
bGVhc2VfZnJvbV9jb250aWd1b3VzKGRldiwgcGFnZSwgY291bnQpKQo+ID4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgX19mcmVlX3BhZ2VzKHBhZ2UsIGdldF9vcmRlcihzaXplKSk7
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGRtYV9mcmVlX2NvbnRpZ3VvdXMoZGV2LCBwYWdlLCBzaXpl
KTsKPiA+ID4gwqB9Cj4gPiA+IAo+ID4gPiDCoHZvaWQgZG1hX2RpcmVjdF9mcmVlX3BhZ2VzKHN0
cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNpemUsIHZvaWQgKmNwdV9hZGRyLAo+ID4gPiAtLQo+
ID4gPiAyLjE3LjEKPiA+ID4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9p
b21tdQ==
