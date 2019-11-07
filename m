Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D337EF2B7D
	for <lists.iommu@lfdr.de>; Thu,  7 Nov 2019 10:53:31 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 31A2413F4;
	Thu,  7 Nov 2019 09:53:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 58AB813DA
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 09:53:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
	[85.215.255.50])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5B2FC196
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573120403;
	s=strato-dkim-0002; d=xenosoft.de;
	h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=trwx3J088ifMSXDlrnn6C1GkVE/t8HLHXAAVx/62/F8=;
	b=eBBZ+/GAnldXokgUZzuM5bIhfmpy+1zL8N77jXhKxY1BRZXkJ9y1gS4Ez1BJ4DhqIc
	KGGhUEkMnWNYXujy7SMqU6Q+Yjjh+yptyLCrOB7LXd/NeJ5vF1egy8BIDOxd8TFGR1LF
	O8RebkgZnb8fxUlOT2l1doJzzKMunfLGLR1ZS39/qvajiz3Y4eeNs23Mo6Yb0olJX1EU
	9DfxRIX6I39PcGGdepXKl9tYqbpL3EP2/B36oQCL8Hzb8M9p55bA3jv6nhJEdUt4ix1G
	Qry+pcAsSS1AoCEh9yRLOl7Os7L4c6IhCIut10rwY0KaLX2OcPwKzPHsBUFKVN1NBlL8
	oV4w==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhWJ4neaR1DEPK76ZrzkovbziPV9Q=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:5146:21ae:8547:c1e0]
	by smtp.strato.de (RZmta 44.29.0 AUTH)
	with ESMTPSA id q007c8vA79rB0Ct
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Thu, 7 Nov 2019 10:53:11 +0100 (CET)
Subject: Re: Bug 205201 - overflow of DMA mask and bus mask
To: Christoph Hellwig <hch@lst.de>
References: <20181213112511.GA4574@lst.de>
	<e109de27-f4af-147d-dc0e-067c8bafb29b@xenosoft.de>
	<ad5a5a8a-d232-d523-a6f7-e9377fc3857b@xenosoft.de>
	<e60d6ca3-860c-f01d-8860-c5e022ec7179@xenosoft.de>
	<008c981e-bdd2-21a7-f5f7-c57e4850ae9a@xenosoft.de>
	<20190103073622.GA24323@lst.de>
	<71A251A5-FA06-4019-B324-7AED32F7B714@xenosoft.de>
	<1b0c5c21-2761-d3a3-651b-3687bb6ae694@xenosoft.de>
	<3504ee70-02de-049e-6402-2d530bf55a84@xenosoft.de>
	<46025f1b-db20-ac23-7dcd-10bc43bbb6ee@xenosoft.de>
	<20191105162856.GA15402@lst.de>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <2f3c81bd-d498-066a-12c0-0a7715cda18f@xenosoft.de>
Date: Thu, 7 Nov 2019 10:53:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105162856.GA15402@lst.de>
Content-Language: de-DE
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net,
	mad skateman <madskateman@gmail.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	iommu@lists.linux-foundation.org,
	Rob Herring <robh+dt@kernel.org>, paulus@samba.org,
	rtd2@xtra.co.nz, "contact@a-eon.com" <contact@a-eon.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

T24gMDUgTm92ZW1iZXIgMjAxOSBhdCA1OjI4IHBtLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToK
PiBPbiBUdWUsIE5vdiAwNSwgMjAxOSBhdCAwODo1NjoyN0FNICswMTAwLCBDaHJpc3RpYW4gWmln
b3R6a3kgd3JvdGU6Cj4+IEhpIEFsbCwKPj4KPj4gV2Ugc3RpbGwgaGF2ZSBETUEgcHJvYmxlbXMg
d2l0aCBzb21lIFBDSSBkZXZpY2VzLiBTaW5jZSB0aGUgUG93ZXJQQyB1cGRhdGVzCj4+IDQuMjEt
MSBbMV0gd2UgbmVlZCB0byBkZWNyZWFzZSB0aGUgUkFNIHRvIDM1MDBNQiAobWVtPTM1MDBNKSBp
ZiB3ZSB3YW50IHRvCj4+IHdvcmsgd2l0aCBvdXIgUENJIGRldmljZXMuIFRoZSBGU0wgUDUwMjAg
YW5kIFA1MDQwIGhhdmUgdGhlc2UgcHJvYmxlbXMKPj4gY3VycmVudGx5Lgo+Pgo+PiBFcnJvciBt
ZXNzYWdlOgo+Pgo+PiBbwqDCoCAyNS42NTQ4NTJdIGJ0dHYgMTAwMDowNDowNS4wOiBvdmVyZmxv
dyAweDAwMDAwMDAwZmUwNzcwMDArNDA5NiBvZiBETUEKPj4gbWFzayBmZmZmZmZmZiBidXMgbWFz
ayBkZjAwMDAwMAo+Pgo+PiBBbGwgNS54IExpbnV4IGtlcm5lbHMgY2FuJ3QgaW5pdGlhbGl6ZSBh
IFNDU0kgUENJIGNhcmQgYW55bW9yZSBzbyBib290aW5nCj4+IG9mIGEgTGludXggdXNlcmxhbmQg
aXNuJ3QgcG9zc2libGUuCj4+Cj4+IFBMRUFTRSBjaGVjayB0aGUgRE1BIGNoYW5nZXMgaW4gdGhl
IFBvd2VyUEMgdXBkYXRlcyA0LjIxLTEgWzFdLiBUaGUga2VybmVsCj4+IDQuMjAgd29ya3Mgd2l0
aCBhbGwgUENJIGRldmljZXMgd2l0aG91dCBsaW1pdGF0aW9uIG9mIFJBTS4KPiBDYW4geW91IHNl
bmQgbWUgdGhlIC5jb25maWcgYW5kIGEgZG1lc2c/ICBBbmQgaW4gdGhlIG1lYW50aW1lIHRyeSB0
aGUKPiBwYXRjaCBiZWxvdz8KPgo+IC0tLQo+ID5Gcm9tIDRkNjU5YjczMTFiZDQxNDFmZGQzZWVl
YjgwZmEyZDc2MDJlYTAxZDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTogTmljb2xh
cyBTYWVueiBKdWxpZW5uZSA8bnNhZW56anVsaWVubmVAc3VzZS5kZT4KPiBEYXRlOiBGcmksIDE4
IE9jdCAyMDE5IDEzOjAwOjQzICswMjAwCj4gU3ViamVjdDogZG1hLWRpcmVjdDogY2hlY2sgZm9y
IG92ZXJmbG93cyBvbiAzMiBiaXQgRE1BIGFkZHJlc3Nlcwo+Cj4gQXMgc2VlbiBvbiB0aGUgbmV3
IFJhc3BiZXJyeSBQaSA0IGFuZCBzdGEyeDExJ3MgRE1BIGltcGxlbWVudGF0aW9uIGl0IGlzCj4g
cG9zc2libGUgZm9yIGEgZGV2aWNlIGNvbmZpZ3VyZWQgd2l0aCAzMiBiaXQgRE1BIGFkZHJlc3Nl
cyBhbmQgYSBwYXJ0aWFsCj4gRE1BIG1hcHBpbmcgbG9jYXRlZCBhdCB0aGUgZW5kIG9mIHRoZSBh
ZGRyZXNzIHNwYWNlIHRvIG92ZXJmbG93LiBJdAo+IGhhcHBlbnMgd2hlbiBhIGhpZ2hlciBwaHlz
aWNhbCBhZGRyZXNzLCBub3QgRE1BYWJsZSwgaXMgdHJhbnNsYXRlZCB0bwo+IGl0J3MgRE1BIGNv
dW50ZXJwYXJ0Lgo+Cj4gRm9yIGV4YW1wbGUgdGhlIFJhc3BiZXJyeSBQaSA0LCBjb25maWd1cmFi
bGUgdXAgdG8gNCBHQiBvZiBtZW1vcnksIGhhcwo+IGFuIGludGVyY29ubmVjdCBjYXBhYmxlIG9m
IGFkZHJlc3NpbmcgdGhlIGxvd2VyIDEgR0Igb2YgcGh5c2ljYWwgbWVtb3J5Cj4gd2l0aCBhIERN
QSBvZmZzZXQgb2YgMHhjMDAwMDAwMC4gSXQgdHJhbnNwaXJlcyB0aGF0LCBhbnkgYXR0ZW1wdCB0
bwo+IHRyYW5zbGF0ZSBwaHlzaWNhbCBhZGRyZXNzZXMgaGlnaGVyIHRoYW4gdGhlIGZpcnN0IEdC
IHdpbGwgcmVzdWx0IGluIGFuCj4gb3ZlcmZsb3cgd2hpY2ggZG1hX2NhcGFibGUoKSBjYW4ndCBk
ZXRlY3QgYXMgaXQgb25seSBjaGVja3MgZm9yCj4gYWRkcmVzc2VzIGJpZ2dlciB0aGVuIHRoZSBt
YXhpbXVtIGFsbG93ZWQgRE1BIGFkZHJlc3MuCj4KPiBGaXggdGhpcyBieSB2ZXJpZnlpbmcgaW4g
ZG1hX2NhcGFibGUoKSBpZiB0aGUgRE1BIGFkZHJlc3MgcmFuZ2UgcHJvdmlkZWQKPiBpcyBhdCBh
bnkgcG9pbnQgbG93ZXIgdGhhbiB0aGUgbWluaW11bSBwb3NzaWJsZSBETUEgYWRkcmVzcyBvbiB0
aGUgYnVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmljb2xhcyBTYWVueiBKdWxpZW5uZSA8bnNhZW56
anVsaWVubmVAc3VzZS5kZT4KPiAtLS0KPiAgIGluY2x1ZGUvbGludXgvZG1hLWRpcmVjdC5oIHwg
OCArKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWRpcmVjdC5oIGIvaW5jbHVkZS9saW51eC9kbWEtZGly
ZWN0LmgKPiBpbmRleCBhZGY5OTNhM2JkNTguLjZhZDllOWVhNzU2NCAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L2RtYS1kaXJlY3QuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZG1hLWRpcmVj
dC5oCj4gQEAgLTMsNiArMyw3IEBACj4gICAjZGVmaW5lIF9MSU5VWF9ETUFfRElSRUNUX0ggMQo+
ICAgCj4gICAjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L21lbWJsb2NrLmg+IC8qIGZvciBtaW5fbG93X3BmbiAqLwo+ICAgI2luY2x1ZGUgPGxpbnV4L21l
bV9lbmNyeXB0Lmg+Cj4gICAKPiAgICNpZmRlZiBDT05GSUdfQVJDSF9IQVNfUEhZU19UT19ETUEK
PiBAQCAtMjcsNiArMjgsMTMgQEAgc3RhdGljIGlubGluZSBib29sIGRtYV9jYXBhYmxlKHN0cnVj
dCBkZXZpY2UgKmRldiwgZG1hX2FkZHJfdCBhZGRyLCBzaXplX3Qgc2l6ZSkKPiAgIAlpZiAoIWRl
di0+ZG1hX21hc2spCj4gICAJCXJldHVybiBmYWxzZTsKPiAgIAo+ICsjaWZuZGVmIENPTkZJR19B
UkNIX0RNQV9BRERSX1RfNjRCSVQKPiArCS8qIENoZWNrIGlmIERNQSBhZGRyZXNzIG92ZXJmbG93
ZWQgKi8KPiArCWlmIChtaW4oYWRkciwgYWRkciArIHNpemUgLSAxKSA8Cj4gKwkJX19waHlzX3Rv
X2RtYShkZXYsIChwaHlzX2FkZHJfdCkobWluX2xvd19wZm4gPDwgUEFHRV9TSElGVCkpKQo+ICsJ
CXJldHVybiBmYWxzZTsKPiArI2VuZGlmCj4gKwo+ICAgCXJldHVybiBhZGRyICsgc2l6ZSAtIDEg
PD0KPiAgIAkJbWluX25vdF96ZXJvKCpkZXYtPmRtYV9tYXNrLCBkZXYtPmJ1c19kbWFfbWFzayk7
Cj4gICB9CkhlbGxvIENocmlzdG9waCwKClRoYW5rcyBhIGxvdCBmb3IgeW91ciBwYXRjaCEgVW5m
b3J0dW5hdGVseSB0aGlzIHBhdGNoIGRvZXNuJ3Qgc29sdmUgdGhlIAppc3N1ZS4KCkVycm9yIG1l
c3NhZ2VzOgoKW8KgwqDCoCA2LjA0MTE2M10gYnR0djogZHJpdmVyIHZlcnNpb24gMC45LjE5IGxv
YWRlZApbwqDCoMKgIDYuMDQxMTY3XSBidHR2OiB1c2luZyA4IGJ1ZmZlcnMgd2l0aCAyMDgwayAo
NTIwIHBhZ2VzKSBlYWNoIGZvciBjYXB0dXJlClvCoMKgwqAgNi4wNDE1NTldIGJ0dHY6IEJ0OHh4
IGNhcmQgZm91bmQgKDApClvCoMKgwqAgNi4wNDE2MDldIGJ0dHY6IDA6IEJ0ODc4IChyZXYgMTcp
IGF0IDEwMDA6MDQ6MDUuMCwgaXJxOiAxOSwgCmxhdGVuY3k6IDEyOCwgbW1pbzogMHhjMjAwMDEw
MDAKW8KgwqDCoCA2LjA0MTYyMl0gYnR0djogMDogdXNpbmc6IFR5cGhvb24gVFZpZXcgUkRTICsg
Rk0gU3RlcmVvIC8gS05DMSBUViAKU3RhdGlvbiBSRFMgW2NhcmQ9NTMsaW5zbW9kIG9wdGlvbl0K
W8KgwqDCoCA2LjA0MjIxNl0gYnR0djogMDogdHVuZXIgdHlwZT01ClvCoMKgwqAgNi4xMTE5OTRd
IGJ0dHY6IDA6IGF1ZGlvIGFic2VudCwgbm8gYXVkaW8gZGV2aWNlIGZvdW5kIQpbwqDCoMKgIDYu
MTc2NDI1XSBidHR2OiAwOiBTZXR0aW5nIFBMTDogMjg2MzYzNjMgPT4gMzU0Njg5NTAgKG5lZWRz
IHVwIHRvIAoxMDBtcykKW8KgwqDCoCA2LjIwMDAwNV0gYnR0djogUExMIHNldCBvawpbwqDCoMKg
IDYuMjA5MzUxXSBidHR2OiAwOiByZWdpc3RlcmVkIGRldmljZSB2aWRlbzAKW8KgwqDCoCA2LjIx
MTU3Nl0gYnR0djogMDogcmVnaXN0ZXJlZCBkZXZpY2UgdmJpMApbwqDCoMKgIDYuMjE0ODk3XSBi
dHR2OiAwOiByZWdpc3RlcmVkIGRldmljZSByYWRpbzAKW8KgIDExNC4yMTg4MDZdIGJ0dHYgMTAw
MDowNDowNS4wOiBvdmVyZmxvdyAweDAwMDAwMDAwZmY1MDcwMDArNDA5NiBvZiAKRE1BIG1hc2sg
ZmZmZmZmZmYgYnVzIG1hc2sgZGYwMDAwMDAKW8KgIDExNC4yMTg4NDhdIE1vZHVsZXMgbGlua2Vk
IGluOiByZmNvbW0gYm5lcCB0dW5lcl9zaW1wbGUgdHVuZXJfdHlwZXMgCnRlYTU3NjcgdHVuZXIg
dGRhNzQzMiB0dmF1ZGlvIG1zcDM0MDAgYnR0diB0ZWE1NzV4IHR2ZWVwcm9tIAp2aWRlb2J1Zl9k
bWFfc2cgdmlkZW9idWZfY29yZSByY19jb3JlIHZpZGVvZGV2IG1jIGJ0dXNiIGJ0cnRsIGJ0YmNt
IApidGludGVsIGJsdWV0b290aCB1aW9fcGRydl9nZW5pcnEgdWlvIGVjZGhfZ2VuZXJpYyBlY2MK
W8KgIDExNC4yMTkwMTJdIFtjMDAwMDAwMWVjZGRmNzIwXSBbODAwMDAwMDAwMDhmZjZlOF0gCi5i
dWZmZXJfcHJlcGFyZSsweDE1MC8weDI2OCBbYnR0dl0KW8KgIDExNC4yMTkwMjldIFtjMDAwMDAw
MWVjZGRmODYwXSBbODAwMDAwMDAwMDhmZmY2Y10gCi5idHR2X3FidWYrMHg1MC8weDY0IFtidHR2
XQoKLS0tLS0KClRyYWNlOgoKW8KgIDQ2Mi43ODMxODRdIENhbGwgVHJhY2U6ClvCoCA0NjIuNzgz
MTg3XSBbYzAwMDAwMDFjNmM2NzQyMF0gW2MwMDAwMDAwMDAwYjMzNThdIAoucmVwb3J0X2FkZHIr
MHhiOC8weGMwICh1bnJlbGlhYmxlKQpbwqAgNDYyLjc4MzE5Ml0gW2MwMDAwMDAxYzZjNjc0OTBd
IFtjMDAwMDAwMDAwMGIzNTFjXSAKLmRtYV9kaXJlY3RfbWFwX3BhZ2UrMHhmMC8weDEyOApbwqAg
NDYyLjc4MzE5NV0gW2MwMDAwMDAxYzZjNjc1MzBdIFtjMDAwMDAwMDAwMGIzNWIwXSAKLmRtYV9k
aXJlY3RfbWFwX3NnKzB4NWMvMHhhYwpbwqAgNDYyLjc4MzIwNV0gW2MwMDAwMDAxYzZjNjc1ZTBd
IFs4MDAwMDAwMDAwODYyZTg4XSAKLl9fdmlkZW9idWZfaW9sb2NrKzB4NjYwLzB4NmQ4IFt2aWRl
b2J1Zl9kbWFfc2ddClvCoCA0NjIuNzgzMjIwXSBbYzAwMDAwMDFjNmM2NzZiMF0gWzgwMDAwMDAw
MDA4NTQyNzRdIAoudmlkZW9idWZfaW9sb2NrKzB4OTgvMHhiNCBbdmlkZW9idWZfY29yZV0KW8Kg
IDQ2Mi43ODMyNzFdIFtjMDAwMDAwMWM2YzY3NzIwXSBbODAwMDAwMDAwMDg2ODZlOF0gCi5idWZm
ZXJfcHJlcGFyZSsweDE1MC8weDI2OCBbYnR0dl0KW8KgIDQ2Mi43ODMyNzZdIFtjMDAwMDAwMWM2
YzY3N2MwXSBbODAwMDAwMDAwMDg1NGFmY10gCi52aWRlb2J1Zl9xYnVmKzB4MmI4LzB4NDI4IFt2
aWRlb2J1Zl9jb3JlXQpbwqAgNDYyLjc4MzI4OF0gW2MwMDAwMDAxYzZjNjc4NjBdIFs4MDAwMDAw
MDAwODY4ZjZjXSAKLmJ0dHZfcWJ1ZisweDUwLzB4NjQgW2J0dHZdClvCoCA0NjIuNzgzMzgzXSBb
YzAwMDAwMDFjNmM2NzhlMF0gWzgwMDAwMDAwMDA3YmYyMDhdIC52NGxfcWJ1ZisweDU0LzB4NjAg
Clt2aWRlb2Rldl0KW8KgIDQ2Mi43ODM0MDJdIFtjMDAwMDAwMWM2YzY3OTcwXSBbODAwMDAwMDAw
MDdjMWVhY10gCi5fX3ZpZGVvX2RvX2lvY3RsKzB4MzBjLzB4M2Y4IFt2aWRlb2Rldl0KW8KgIDQ2
Mi43ODM0MjFdIFtjMDAwMDAwMWM2YzY3YTgwXSBbODAwMDAwMDAwMDdjM2MwOF0gCi52aWRlb191
c2VyY29weSsweDE4Yy8weDNkYyBbdmlkZW9kZXZdClvCoCA0NjIuNzgzNDQwXSBbYzAwMDAwMDFj
NmM2N2MwMF0gWzgwMDAwMDAwMDA3YmIxNGNdIAoudjRsMl9pb2N0bCsweDYwLzB4NzggW3ZpZGVv
ZGV2XQpbwqAgNDYyLjc4MzQ2MF0gW2MwMDAwMDAxYzZjNjdjOTBdIFs4MDAwMDAwMDAwN2QzYzQ4
XSAKLnY0bDJfY29tcGF0X2lvY3RsMzIrMHg5YjQvMHgxODUwIFt2aWRlb2Rldl0KW8KgIDQ2Mi43
ODM0NjhdIFtjMDAwMDAwMWM2YzY3ZDcwXSBbYzAwMDAwMDAwMDFhZDljY10gCi5fX3NlX2NvbXBh
dF9zeXNfaW9jdGwrMHgyODQvMHgxMjdjClvCoCA0NjIuNzgzNDczXSBbYzAwMDAwMDFjNmM2N2Uy
MF0gW2MwMDAwMDAwMDAwMDA2N2NdIHN5c3RlbV9jYWxsKzB4NjAvMHg2YwpbwqAgNDYyLjc4MzQ3
NV0gSW5zdHJ1Y3Rpb24gZHVtcDoKW8KgIDQ2Mi43ODM0NzddIDQwZmUwMDQ0IDYwMDAwMDAwIDg5
MjI1NWQwIDJmODkwMDAwIDQwZmUwMDIwIDNjODJmZmM1IAozOTIwMDAwMSA2MDAwMDAwMApbwqAg
NDYyLjc4MzQ4M10gMzg4NDIwMjkgOTkyMjU1ZDAgNDg1YWQwZDkgNjAwMDAwMDAgPDBmZTAwMDAw
PiAzODIxMDA3MCAKZTgwMTAwMTAgN2MwODAzYTYKW8KgIDQ2Mi43ODM0OTBdIC0tLVsgZW5kIHRy
YWNlIGI2NzdkNGEwMDQ1OGUyNzcgXS0tLQoKLS0tLS0KCmRtZXNnIGZzbCBwNTA0MDogaHR0cHM6
Ly9idWd6aWxsYS5rZXJuZWwub3JnL2F0dGFjaG1lbnQuY2dpP2lkPTI4NTgxMwoKS2VybmVsIDUu
NC1yYzYgY29uZmlnIGZvciB0aGUgQ3lydXMrIGJvYXJkIGFuZCBmb3IgdGhlIFFFTVUgcHBjZTUw
MCAKYm9hcmQgKENQVTogUDUwNDAgYW5kIFA1MDIwKTogCmh0dHBzOi8vYnVnemlsbGEua2VybmVs
Lm9yZy9hdHRhY2htZW50LmNnaT9pZD0yODU4MTUKCkJ1ZyByZXBvcnQ6IGh0dHBzOi8vYnVnemls
bGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA1MjAxCgpUaGFua3MgZm9yIHlvdXIgaGVs
cCwKCkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
