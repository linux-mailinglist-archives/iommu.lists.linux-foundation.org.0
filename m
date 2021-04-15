Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D98C360348
	for <lists.iommu@lfdr.de>; Thu, 15 Apr 2021 09:27:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B292A40FB2;
	Thu, 15 Apr 2021 07:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRlBL3E_mNkm; Thu, 15 Apr 2021 07:27:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65FF140FB1;
	Thu, 15 Apr 2021 07:27:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A3A8C0012;
	Thu, 15 Apr 2021 07:27:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2D9BC000A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 07:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB1E940FAC
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 07:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNDIQgTUiNzo for <iommu@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:27:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B642140FAB
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 07:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618471643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ekzj4mcW27qGn3lH96EGgzNbzBUSOojlu95Su7o6jyE=;
 b=VlfPCYkpASG2AmSP6vMbpGtXsnrz7ckzRb1atGApkn3wqEpJ3+ReaNZ9r5+UNFo0rqkjzD
 VmZfNK51eb5DcYTIGcWU6DLj5KgcvooFERbOlMseXh5C+V/NygLLJ981fl27HtL7sIR1Vu
 bImPjvQkYWyg57B7hJFa9jqz3oIIG90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-roGooyyyNJGAwnRl2CDabA-1; Thu, 15 Apr 2021 03:27:19 -0400
X-MC-Unique: roGooyyyNJGAwnRl2CDabA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80CE39F92F;
 Thu, 15 Apr 2021 07:27:17 +0000 (UTC)
Received: from [10.36.114.81] (ovpn-114-81.ams2.redhat.com [10.36.114.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3AE41969E;
 Thu, 15 Apr 2021 07:27:12 +0000 (UTC)
Subject: Re: [RFC PATCH v2 1/8] ACPICA: IORT: Update for revision E
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, devel@acpica.org
References: <20201119121150.3316-1-shameerali.kolothum.thodi@huawei.com>
 <20201119121150.3316-2-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <da7b36fb-b30c-2d87-0934-7021d1093a1a@redhat.com>
Date: Thu, 15 Apr 2021 09:27:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20201119121150.3316-2-shameerali.kolothum.thodi@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: linuxarm@huawei.com, steven.price@arm.com, guohanjun@huawei.com,
 Sami.Mujawar@arm.com, robin.murphy@arm.com, wanghuiqiang@huawei.com
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

SGkgU2hhbWVlciwKCk9uIDExLzE5LzIwIDE6MTEgUE0sIFNoYW1lZXIgS29sb3RodW0gd3JvdGU6
Cj4gSU9SVCByZXZpc2lvbiBFIGNvbnRhaW5zIGEgZmV3IGFkZGl0aW9ucyBsaWtlLAo+IMKgIMKg
IC1BZGRlZCBhbiBpZGVudGlmaWVyIGZpZWxkIGluIHRoZSBub2RlIGRlc2NyaXB0b3JzIHRvIGFp
ZCB0YWJsZQo+IMKgIMKgIMKgY3Jvc3MtcmVmZXJlbmNpbmcuCj4gwqAgwqAgLUludHJvZHVjZWQg
dGhlIFJlc2VydmVkIE1lbW9yeSBSYW5nZShSTVIpIG5vZGUuIFRoaXMgaXMgdXNlZAo+ICDCoCDC
oCB0byBkZXNjcmliZSBtZW1vcnkgcmFuZ2VzIHRoYXQgYXJlIHVzZWQgYnkgZW5kcG9pbnRzIGFu
ZCByZXF1aXJlcwo+ICDCoCDCoCBhIHVuaXR5IG1hcHBpbmcgaW4gU01NVS4KPiAgICAgLUludHJv
ZHVjZWQgYSBmbGFnIGluIHRoZSBSQyBub2RlIHRvIGV4cHJlc3Mgc3VwcG9ydCBmb3IgUFJJLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFNoYW1lZXIgS29sb3RodW0gPHNoYW1lZXJhbGkua29sb3RodW0u
dGhvZGlAaHVhd2VpLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9hY3BpL2FjdGJsMi5oIHwgMjUgKysr
KysrKysrKysrKysrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hY3BpL2FjdGJsMi5o
IGIvaW5jbHVkZS9hY3BpL2FjdGJsMi5oCj4gaW5kZXggZWM2Njc3OWNiMTkzLi4yNzRmY2U3YjVj
MDEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9hY3BpL2FjdGJsMi5oCj4gKysrIGIvaW5jbHVkZS9h
Y3BpL2FjdGJsMi5oCj4gQEAgLTY4LDcgKzY4LDcgQEAKPiAgICogSU9SVCAtIElPIFJlbWFwcGlu
ZyBUYWJsZQo+ICAgKgo+ICAgKiBDb25mb3JtcyB0byAiSU8gUmVtYXBwaW5nIFRhYmxlIFN5c3Rl
bSBTb2Z0d2FyZSBvbiBBUk0gUGxhdGZvcm1zIiwKPiAtICogRG9jdW1lbnQgbnVtYmVyOiBBUk0g
REVOIDAwNDlELCBNYXJjaCAyMDE4Cj4gKyAqIERvY3VtZW50IG51bWJlcjogQVJNIERFTiAwMDQ5
RSwgSnVuZSAyMDIwCj4gICAqCj4gICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiovCj4gIAo+IEBAIC04
Niw3ICs4Niw4IEBAIHN0cnVjdCBhY3BpX2lvcnRfbm9kZSB7Cj4gIAl1OCB0eXBlOwo+ICAJdTE2
IGxlbmd0aDsKPiAgCXU4IHJldmlzaW9uOwo+IC0JdTMyIHJlc2VydmVkOwo+ICsJdTE2IHJlc2Vy
dmVkOwo+ICsJdTE2IGlkZW50aWZpZXI7Cj4gIAl1MzIgbWFwcGluZ19jb3VudDsKPiAgCXUzMiBt
YXBwaW5nX29mZnNldDsKPiAgCWNoYXIgbm9kZV9kYXRhWzFdOwo+IEBAIC0xMDAsNyArMTAxLDgg
QEAgZW51bSBhY3BpX2lvcnRfbm9kZV90eXBlIHsKPiAgCUFDUElfSU9SVF9OT0RFX1BDSV9ST09U
X0NPTVBMRVggPSAweDAyLAo+ICAJQUNQSV9JT1JUX05PREVfU01NVSA9IDB4MDMsCj4gIAlBQ1BJ
X0lPUlRfTk9ERV9TTU1VX1YzID0gMHgwNCwKPiAtCUFDUElfSU9SVF9OT0RFX1BNQ0cgPSAweDA1
Cj4gKwlBQ1BJX0lPUlRfTk9ERV9QTUNHID0gMHgwNSwKPiArCUFDUElfSU9SVF9OT0RFX1JNUiA9
IDB4MDYsCj4gIH07Cj4gIAo+ICBzdHJ1Y3QgYWNwaV9pb3J0X2lkX21hcHBpbmcgewo+IEBAIC0x
NjcsMTAgKzE2OSwxMCBAQCBzdHJ1Y3QgYWNwaV9pb3J0X3Jvb3RfY29tcGxleCB7Cj4gIAl1OCBy
ZXNlcnZlZFszXTsJCS8qIFJlc2VydmVkLCBtdXN0IGJlIHplcm8gKi8KPiAgfTsKPiAgCj4gLS8q
IFZhbHVlcyBmb3IgYXRzX2F0dHJpYnV0ZSBmaWVsZCBhYm92ZSAqLwo+ICsvKiBNYXNrcyBmb3Ig
YXRzX2F0dHJpYnV0ZSBmaWVsZCBhYm92ZSAqLwo+ICAKPiAtI2RlZmluZSBBQ1BJX0lPUlRfQVRT
X1NVUFBPUlRFRCAgICAgICAgIDB4MDAwMDAwMDEJLyogVGhlIHJvb3QgY29tcGxleCBzdXBwb3J0
cyBBVFMgKi8KPiAtI2RlZmluZSBBQ1BJX0lPUlRfQVRTX1VOU1VQUE9SVEVEICAgICAgIDB4MDAw
MDAwMDAJLyogVGhlIHJvb3QgY29tcGxleCBkb2Vzbid0IHN1cHBvcnQgQVRTICovCj4gKyNkZWZp
bmUgQUNQSV9JT1JUX0FUU19TVVBQT1JURUQgICAgICAgICAoMSkJLyogVGhlIHJvb3QgY29tcGxl
eCBzdXBwb3J0cyBBVFMgKi8KPiArI2RlZmluZSBBQ1BJX0lPUlRfUFJJX1NVUFBPUlRFRCAgICAg
ICAgICgxPDwxKQkvKiBUaGUgcm9vdCBjb21wbGV4IHN1cHBvcnRzIFBSSSAqLwo+ICAKPiAgc3Ry
dWN0IGFjcGlfaW9ydF9zbW11IHsKPiAgCXU2NCBiYXNlX2FkZHJlc3M7CS8qIFNNTVUgYmFzZSBh
ZGRyZXNzICovCj4gQEAgLTI0MSw2ICsyNDMsMTcgQEAgc3RydWN0IGFjcGlfaW9ydF9wbWNnIHsK
PiAgCXU2NCBwYWdlMV9iYXNlX2FkZHJlc3M7Cj4gIH07Cj4gIAo+ICtzdHJ1Y3QgYWNwaV9pb3J0
X3JtciB7CnNvIGluZGVlZCBpbiBFLmIgdGhlcmUgaXMgYSBuZXcgZmllbGQgaGVyZS4KdTMyIGZs
YWdzCj4gKwl1MzIgcm1yX2NvdW50Owo+ICsJdTMyIHJtcl9vZmZzZXQ7Cj4gK307Cj4gKwo+ICtz
dHJ1Y3QgYWNwaV9pb3J0X3Jtcl9kZXNjIHsKPiArCXU2NCBiYXNlX2FkZHJlc3M7Cj4gKwl1NjQg
bGVuZ3RoOwo+ICsJdTMyIHJlc2VydmVkOwo+ICt9Owo+ICsKPiAgLyoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioKPiAgICoKPiAgICogSVZSUyAtIEkvTyBWaXJ0dWFsaXphdGlvbiBSZXBvcnRpbmcgU3Ry
dWN0dXJlCj4gClRoYW5rcwoKRXJpYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lvbW11
