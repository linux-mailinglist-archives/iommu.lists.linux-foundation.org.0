Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CED0283140
	for <lists.iommu@lfdr.de>; Tue,  6 Aug 2019 14:21:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7C40FDCB;
	Tue,  6 Aug 2019 12:21:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 508B5DBC
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 12:21:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A884582D
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 12:20:59 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1huySY-0006uH-1d; Tue, 06 Aug 2019 14:20:58 +0200
Message-ID: <1565094057.2323.28.camel@pengutronix.de>
Subject: Re: Regression due to d98849aff879 (dma-direct: handle
	DMA_ATTR_NO_KERNEL_MAPPING in common code)
From: Lucas Stach <l.stach@pengutronix.de>
To: Christoph Hellwig <hch@lst.de>
Date: Tue, 06 Aug 2019 14:20:57 +0200
In-Reply-To: <20190806113318.GA20215@lst.de>
References: <1565082809.2323.24.camel@pengutronix.de>
	<20190806113318.GA20215@lst.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: iommu@lists.linux-foundation.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
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

QW0gRGllbnN0YWcsIGRlbiAwNi4wOC4yMDE5LCAxMzozMyArMDIwMCBzY2hyaWViIENocmlzdG9w
aCBIZWxsd2lnOgo+IE9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDExOjEzOjI5QU0gKzAyMDAsIEx1
Y2FzIFN0YWNoIHdyb3RlOgo+ID4gSGkgQ2hyaXN0b3BoLAo+ID4gCj4gPiBJIGp1c3QgZm91bmQg
YSByZWdyZXNzaW9uIHdoZXJlIG15IE5WTWUgZGV2aWNlIGlzIG5vIGxvbmdlciBhYmxlIHRvCj4g
PiBzZXQKPiA+IHVwIGl0cyBITUIuCj4gPiAKPiA+IEFmdGVyIHN1YmplY3QgY29tbWl0IGRtYV9k
aXJlY3RfYWxsb2NfcGFnZXMoKSBpcyBubyBsb25nZXIKPiA+IGluaXRpYWxpemluZwo+ID4gZG1h
X2hhbmRsZSBwcm9wZXJseSB3aGVuIERNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5HIGlzIHNldCwg
YXMgdGhlCj4gPiBmdW5jdGlvbiBpcyBub3cgcmV0dXJuaW5nIHRvbyBlYXJseS4KPiA+IAo+ID4g
Tm93IHRoaXMgY291bGQgZWFzaWx5IGJlIGZpeGVkIGJ5IGFkZGluZyB0aGUgcGh5X3RvX2RtYSB0
cmFuc2xhdGlvbgo+ID4gdG8KPiA+IHRoZSBOT19LRVJORUxfTUFQUElORyBjb2RlIHBhdGgsIGJ1
dCBJJ20gbm90IHN1cmUgaG93IHRoaXMgc3R1ZmYKPiA+IGludGVyYWN0cyB3aXRoIHRoZSBtZW1v
cnkgZW5jcnlwdGlvbiBzdHVmZiBzZXQgdXAgbGF0ZXIgaW4gdGhlCj4gPiBmdW5jdGlvbiwgc28g
SSBndWVzcyB0aGlzIHNob3VsZCBiZSBsb29rZWQgYXQgYnkgc29tZW9uZSB3aXRoIG1vcmUKPiA+
IGV4cGVyaWVuY2Ugd2l0aCB0aGlzIGNvZGUgdGhhbiBtZS4KPiAKPiBUaGVyZSBpcyBub3QgbXVj
aCB3ZSBjYW4gZG8gYWJvdXQgdGhlIG1lbW9yeSBlbmNyeXB0aW9uIGNhc2UgaGVyZSwKCldoaWNo
IEkgd291bGQgZ3Vlc3MgbWVhbnMgd2UgbmVlZCB0byBpZ25vcmUgRE1BX0FUVFJfTk9fS0VSTkVM
X01BUFBJTkcKaW4gdGhhdCBjYXNlIGluc3RlYWQgb2YgZHJvcHBpbmcgb3V0IGVhcmx5PwoKPiBh
cyB0aGF0IHJlcXVpcmVzIGEga2VybmVsIGFkZHJlc3MgdG8gbWFyayB0aGUgbWVtb3J5IGFzIHVu
ZW5jcnlwdGVkLgo+IAo+IFNvIHRoZSBvYnZpb3VzIHRyaXZpYWwgZml4IGlzIHByb2JhYmx5IHRo
ZSByaWdodCBvbmU6Cj4gCj4gCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9kbWEvZGlyZWN0LmMgYi9r
ZXJuZWwvZG1hL2RpcmVjdC5jCj4gaW5kZXggNTliZGNlZWEzNzM3Li5jNDkxMjAxOTMzMDkgMTAw
NjQ0Cj4gLS0tIGEva2VybmVsL2RtYS9kaXJlY3QuYwo+ICsrKyBiL2tlcm5lbC9kbWEvZGlyZWN0
LmMKPiBAQCAtMTM1LDYgKzEzNSw3IEBAIHZvaWQgKmRtYV9kaXJlY3RfYWxsb2NfcGFnZXMoc3Ry
dWN0IGRldmljZSAqZGV2LAo+IHNpemVfdCBzaXplLAo+IMKgCQlpZiAoIVBhZ2VIaWdoTWVtKHBh
Z2UpKQo+IMKgCQkJYXJjaF9kbWFfcHJlcF9jb2hlcmVudChwYWdlLCBzaXplKTsKPiDCoAkJLyog
cmV0dXJuIHRoZSBwYWdlIHBvaW50ZXIgYXMgdGhlIG9wYXF1ZSBjb29raWUgKi8KPiArCQkqZG1h
X2hhbmRsZSA9IHBoeXNfdG9fZG1hKGRldiwgcGFnZV90b19waHlzKHBhZ2UpKTsKPiDCoAkJcmV0
dXJuIHBhZ2U7Cj4gwqAJfQo+IMKgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by9pb21tdQ==
