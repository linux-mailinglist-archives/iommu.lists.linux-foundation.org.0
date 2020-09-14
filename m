Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9850C2682A8
	for <lists.iommu@lfdr.de>; Mon, 14 Sep 2020 04:35:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 480B5867D8;
	Mon, 14 Sep 2020 02:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtJ4Q0y55yHD; Mon, 14 Sep 2020 02:35:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5A71F866E7;
	Mon, 14 Sep 2020 02:35:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36C8DC0051;
	Mon, 14 Sep 2020 02:35:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F0F9C0051
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 02:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 514F3203AA
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 02:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kaeZavdUCaE for <iommu@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 02:35:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 83C6A20023
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 02:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600050942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JuEVqBIYofi1f+3PPcI8zQb71WljDFGGzBS/722/WcA=;
 b=QGu1M93fTaGeoYrx9TnMIN7FWfIJ3yovlRK9nfewDTX4WeZjupip/ykDSAQDhibwxbRc4X
 w24zJMiKACUqkCz2sA+fTP5N3PNjpRrg8+WxyI5SZSOuqAF9s6EVwC8qF8WfIeF9H8KX8q
 N//8dliWrHW6y5nLhvHajUmm8nJXAAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-pJ8OkG1_PI2ueqBXsrJlyw-1; Sun, 13 Sep 2020 22:35:39 -0400
X-MC-Unique: pJ8OkG1_PI2ueqBXsrJlyw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7D8C1091063;
 Mon, 14 Sep 2020 02:35:37 +0000 (UTC)
Received: from [10.72.13.25] (ovpn-13-25.pek2.redhat.com [10.72.13.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1773819C4F;
 Mon, 14 Sep 2020 02:35:27 +0000 (UTC)
Subject: Re: [PATCH] intel-iommu: don't disable ATS for device without page
 aligned request
To: "Raj, Ashok" <ashok.raj@intel.com>
References: <20200909083432.9464-1-jasowang@redhat.com>
 <20200909171056.GF104641@otc-nc-03>
 <491540137.16465450.1599704255365.JavaMail.zimbra@redhat.com>
 <20200910155303.GC97190@otc-nc-03>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ef925e93-5931-0c50-d154-9fd332b1e87d@redhat.com>
Date: Mon, 14 Sep 2020 10:35:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910155303.GC97190@otc-nc-03>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: mst@redhat.com, linux-kernel@vger.kernel.org,
 Keith Busch <keith.busch@intel.com>, eperezma@redhat.com,
 iommu@lists.linux-foundation.org, stable@vger.kernel.org, dwmw2@infradead.org
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

Ck9uIDIwMjAvOS8xMCDkuIvljYgxMTo1MywgUmFqLCBBc2hvayB3cm90ZToKPiBPbiBXZWQsIFNl
cCAwOSwgMjAyMCBhdCAxMDoxNzozNVBNIC0wNDAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pgo+PiAt
LS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4+PiBIaSBKYXNvbgo+Pj4KPj4+IE9uIFdlZCwg
U2VwIDA5LCAyMDIwIGF0IDA0OjM0OjMyUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4g
Q29tbWl0IDYxMzYzYzE0NzRiMSAoImlvbW11L3Z0LWQ6IEVuYWJsZSBBVFMgb25seSBpZiB0aGUg
ZGV2aWNlIHVzZXMKPj4+PiBwYWdlIGFsaWduZWQgYWRkcmVzcy4iKSBkaXNhYmxlcyBBVFMgZm9y
IGRldmljZSB0aGF0IGNhbiBkbyB1bmFsaWduZWQKPj4+PiBwYWdlIHJlcXVlc3QuCj4+PiBEaWQg
eW91IHRha2UgYSBsb29rIGF0IHRoZSBQQ0kgc3BlY2lmaWNhdGlvbj8KPj4+IFBhZ2UgQWxpZ25l
ZCBSZXF1ZXN0IGlzIGluIHRoZSBBVFMgY2FwYWJpbGl0eSBSZWdpc3Rlci4KPj4+Cj4+PiBBVFMg
Q2FwYWJpbGl0eSBSZWdpc3RlciAoT2Zmc2V0IDB4MDRoKQo+Pj4KPj4+IGJpdCAoNSk6Cj4+PiBQ
YWdlIEFsaWduZWQgUmVxdWVzdCAtIElmIFNldCwgaW5kaWNhdGVzIHRoZSBVbnRyYW5zbGF0ZWQg
YWRkcmVzcyBpcyBhbHdheXMKPj4+IGFsaWduZWQgdG8gNDA5NiBieXRlIGJvdW5kYXJ5LiBTZXR0
aW5nIHRoaXMgZmllbGQgaXMgcmVjb21tZW5kZWQuIFRoaXMKPj4+IGZpZWxkIHBlcm1pdHMgc29m
dHdhcmUgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiBpbXBsZW1udGF0aW9ucyBjb21wYXRpYmxlCj4+
PiB3aXRoIHRoaXMgc3BlY2lmaWNhdGlvbiBhbmQgdGhvc2UgY29tcGF0aWJsZSB3aXRoIGFuIGVh
cmxpZXIgdmVyc2lvbiBvZgo+Pj4gdGhpcyBzcGVjaWZpY2F0aW9uIGluIHdoaWNoIGEgUmVxdWVz
dGVyIHdhcyBwZXJtaXR0ZWQgdG8gc3VwcGx5IGFueXRoaW5nIGluCj4+PiBiaXRzIFsxMToyXS4K
Pj4gWWVzLCBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhpcyBpcyBvcHRpb25hbCBub3QgbWFu
ZGF0b3J5Lgo+IENvcnJlY3QsIGJ1dCBvcHRpb25hbCBvbiB0aGUgZGV2aWNlIHNpZGUuIEFuIElP
TU1VIG1pZ2h0ICpyZXF1aXJlKiB0aGlzIGZvcgo+IHByb3BlciBub3JtYWwgb3BlcmF0aW9uLiBP
dXIgSU9NTVUncyBkbyBub3QgZ2V0IHRoZSBsb3cgMTIgYml0cy4gV2hpY2ggaXMKPiB3aHkgdGhl
IHNwZWMgZ2l2ZXMgU1cgYSB3YXkgdG8gZGV0ZWN0IGlmIHRoZSBkZXZpY2UgaXMgY29tcGF0aWJs
ZSBmb3IgdGhpcwo+IElPTU1VIGltcGxlbWVudGF0aW9uLgoKCkkgc2VlLCBpdCdzIGJldHRlciB0
byBjbGFyaWZ5IHRoaXMgaW4gdGhlIHNwZWMgKG9yIGlzIHRoZXJlIGFscmVhZHkgaGFkIAphIHNl
Y3Rpb24gZm9yIHRoaXM/KQoKCj4KPj4+PiBUaGlzIGxvb2tzIHdyb25nLCBzaW5jZSB0aGUgY29t
bWl0IGxvZyBzYWlkIGl0J3MgYmVjYXVzZSB0aGUgcGFnZQo+Pj4+IHJlcXVlc3QgZGVzY3JpcHRv
ciBkb2Vzbid0IHN1cHBvcnQgcmVwb3J0aW5nIHVuYWxpZ25lZCByZXF1ZXN0Lgo+Pj4gSSBkb24n
dCB0aGluayB5b3UgY2FuIGNoYW5nZSB0aGUgZGVmaW5pdGlvbiBmcm9tIEFUUyB0byBQUkkuIEJv
dGggYXJlCj4+PiBvcnRob2dvbmFsIGZlYXR1cmUuCj4+IEkgbWF5IG1pc3Mgc29tZXRoaW5nLCBo
ZXJlJ3MgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0Ogo+Pgo+PiAtIHBhZ2UgcmVxdWVzdCBkZXNj
cmlwdG9yIHdpbGwgb25seSBiZSB1c2VkIHdoZW4gUFJTIGlzIGVuYWJsZWQKPj4gLSBBVFMgc3Bl
YyBhbGxvd3MgdW5hbGlnbmVkIHJlcXVlc3QKPj4KPj4gU28gYW55IHJlYXNvbiBmb3IgZGlzYWJs
aW5nIEFUUyBmb3IgdW5hbGlnbmVkIHJlcXVlc3QgZXZlbiBpZiBQUlMgaXMKPj4gbm90IGVuYWJs
ZWQ/Cj4gSSB0aGluayB5b3UgYXJlIGdldHRpbmcgY29uZnVzZWQgYmV0d2VlbiB0aGUgMiBkaWZm
ZXJlbnQgUENJZSBmZWF0dXJlcy4KPgo+IEFUUyAtIEFkZHJlc3MgVHJhbnNsYXRpb24gU2Vydmlj
ZXMuIFVzZWQgYnkgZGV2aWNlIHRvIHNpbXBseSByZXF1ZXN0IHRoZQo+IEhvc3QgUGh5c2ljYWwg
QWRkcmVzcyBmb3Igc29tZSBETUEgb3BlcmF0aW9uLgo+Cj4gV2hlbiBBVFMgcmVzcG9uc2UgaW5k
aWNhdGVzIGZhaWxlZCwgdGhlbiB0aGUgZGV2aWNlIGNhbiByZXF1ZXN0IGEKPiBwYWdlLXJlcXVl
c3QgKFBSUyB0aGlzIGlzIGxpa2UgYSBkZXZpY2UgcGFnZS1mYXVsdCksIGFuZCB0aGVuIElPTU1V
IGRyaXZlcgo+IHdvdWxkIHdvcmsgd2l0aCB0aGUga2VybmVsIHRvIGZhdWx0IGEgcGFnZSB0aGVu
IHJlc3BvbmQgd2l0aAo+IChQYWdlLXJlc3BvbnNlKSBzdWNjZXNzL2ZhaWx1cmUuIFRoZW4gdGhl
IGRldmljZSB3aWxsIHNlbmQgYSBuZXcgQVRTCj4gdG8gZ2V0IHRoZSBuZXcgdHJhbnNsYXRpb24u
CgoKWWVzLCB0aGF0J3MgbXkgdW5kZXJzdGFuZGluZyBhcyB3ZWxsLiBJIHRoaW5rIHdoYXQgY29u
ZnVzZXMgbWUgaXMgdGhlIApjb21taXQgbG9nIG9mIDYxMzYzYzE0NzRiMSB3aGljaCB0aWVzIGEg
UFJJIHF1ZXVlIHRvIEFUUyBmZWF0dXJlcyAuLi4KCgo+Cj4KPj4+PiBBIHZpY3RpbSBpcyBRZW11
J3MgdmlydGlvLXBjaSB3aGljaCBkb2Vzbid0IGFkdmVydGlzZSB0aGUgcGFnZSBhbGlnbmVkCj4+
Pj4gYWRkcmVzcy4gRml4aW5nIGJ5IGRpc2FibGUgUFJJIGluc3RlYWQgb2YgQVRTIGlmIGRldmlj
ZSBkb2Vzbid0IGhhdmUKPj4+PiBwYWdlIGFsaWduZWQgcmVxdWVzdC4KPj4+IFRoaXMgaXMgYSBy
ZXF1aXJlbWVudCBmb3IgdGhlIEludGVsIElPTU1VJ3MuCj4+Pgo+Pj4gWW91IHNheSB2aXJ0aW8s
IHNvIGlzIGl0IGFsbCBlbXVsYXRlZCBkZXZpY2Ugb3IgeW91IHRhbGtpbmcgYWJvdXQgc29tZQo+
Pj4gaGFyZHdhcmUgdGhhdCBpbXBsZW1lbnRlZCB2aXJ0aW8tcGNpIGNvbXBsaWFudCBodz8gSWYg
eW91IGFyZSBzdXJlIHRoZQo+Pj4gZGV2aWNlIGFjdHVhbGx5IGRvZXMgY29tcGx5IHdpdGggdGhl
IHJlcXVpcmVtZW50LCBidXQganVzdCBub3QgZW51bWVyYXRpbmcKPj4+IHRoZSBjYXBhYmlsaXR5
LCB5b3UgY2FuIG1heWJlIHdvcmsgYSBxdWlyayB0byBvdmVyY29tZSB0aGF0Pwo+PiBTbyBmYXIg
b25seSBlbXVsYXRlZCBkZXZpY2VzLiBCdXQgd2UgYXJlIGhlbHBpbmcgc29tZSB2ZW5kb3IgdG8K
Pj4gaW1wbGVtZW50IHZpcnRpbyBoYXJkd2FyZSBzbyAgd2UgbmVlZCB0byB1bmRlcnN0YW5kIHRo
ZSBjb25uZWN0aW9uCj4+IGJldHdlZW4gQVRTIGFsaWdubWVudCBhbmQgcGFnZSByZXF1ZXN0IGRl
c2NyaXB0b3IuCj4gQVRTIGFuZCBQUlMgYXJlIDIgc2VwYXJhdGUgb3J0aG9nb25hbCBmZWF0dXJl
cy4KPiBQUlMgcmVxdWlyZXMgQVRTLCBidXQgbm90IHRoZSBvdGhlciB3YXkgYXJvdW5kLgo+Cj4+
PiBOb3cgUFJJIGFsc28gaGFzIGFuIGFsaWdubWVudCByZXF1aXJlbWVudCwgYW5kIEludGVsIElP
TU1VJ3MgcmVxdWlyZXMgdGhhdAo+Pj4gYXMgd2VsbC4gSWYgeW91ciBkZXZpY2Ugc3VwcG9ydHMg
U1JJT1YgYXMgd2VsbCwgUEFTSUQgYW5kIFBSSSBhcmUKPj4+IGVudW1lcmF0ZWQganVzdCBvbiB0
aGUgUEYgYW5kIG5vdCB0aGUgVkYuIFlvdSBtaWdodCB3YW50IHRvIHBheSBhdHRlbnNpb24KPj4+
IHRvIHRoYXQuIFdlIGFyZSBzdGlsbCB3b3JraW5nIG9uIGEgc29sdXRpb24gZm9yIHRoYXQgcHJv
YmxlbS4KPj4gVGhhbmtzIGZvciB0aGUgcmVtaW5kaW5nLCBidXQgaXQgbG9va3MgdG8gbWUgYWNj
b3JkaW5nIHRvIHRoZSBBVFMKPj4gc3BlYywgYWxsIFBSSSBtZXNzYWdlIGlzIDQwOTYgYnl0ZSBh
bGlnbmVkPyBFLmcgbG93ZXIgYml0ZXMgd2VyZSB1c2VkCj4+IGZvciBncm91cCBpbmRleCBldGMu
Cj4gUmlnaHQsIEkgc2hvdWxkIGhhdmUgYmVlbiBjbGVhci4gVGhlIGlzc3VlIHdpdGggUFJJIGlz
IHdlIHJlcXVpcmUgcmVzcG9uc2VzCj4gdG8gaGF2ZSBQQVNJRCBmaWVsZCBzZXQuIFRoZXJlIGlz
IGFub3RoZXIgY2FwYWJpbGl0eSBvbiB0aGUgZGV2aWNlIHRoYXQKPiBleHBvc2VzIHRoYXQuIHBj
aV9wcmdfcmVzcF9wYXNpZF9yZXF1aXJlZCgpLiBUaGlzIGlzIHJlcXVpcmVkIHRvIGVuYWJsZSBQ
UkkKPiBmb3IgYSBkZXZpY2UuCgoKUmlnaHQuIFRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24s
IEkgd2lsbCB3aXRoZHJhdyB0aGlzIHBhdGNoLgoKCj4KPiBDaGVlcnMsCj4gQXNob2sKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGlu
ZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
