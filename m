Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 169BC50CEC4
	for <lists.iommu@lfdr.de>; Sun, 24 Apr 2022 04:58:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA68260A79;
	Sun, 24 Apr 2022 02:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RV961kzEO86m; Sun, 24 Apr 2022 02:58:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 76DBD606FF;
	Sun, 24 Apr 2022 02:58:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53F63C002D;
	Sun, 24 Apr 2022 02:58:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1546AC002D
 for <iommu@lists.linux-foundation.org>; Sun, 24 Apr 2022 02:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E868782457
 for <iommu@lists.linux-foundation.org>; Sun, 24 Apr 2022 02:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qlarbN5FIy2w for <iommu@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 02:58:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE7EE82456
 for <iommu@lists.linux-foundation.org>; Sun, 24 Apr 2022 02:58:22 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id p65so21286863ybp.9
 for <iommu@lists.linux-foundation.org>; Sat, 23 Apr 2022 19:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OfK0tpH8kjdC9aBzVRfEMO2JK1yjN5Ywppuc5BMNAlk=;
 b=ZrqpxbfZ3cuZUK51/uH7rLYXtNAJAp/IxiV2Sv4efZ2FMmEUNn1nY5gEFyS4300vqQ
 nSwbu4hfi3bY+mbLS8sSPdqR0jbU+LWXgwB4RS4bluGWteiR7swukscJPG9E0ulfg34d
 Q/CIQdjpYzQJjlaBv3nTMrHX47NnG8ADeEnzGZrjYtUligyqJWVKKJMxoKQRU8cpGcXF
 bAJp8b8V7MCArs6ZqKiiuQcNvGpaO/LKBN2nO/2nFqwWA6fswqAcGILOBl4VDAXo0sOj
 Yo52+gZnB8DYDi93Qe6vI39XcFFbYCO4keXyepqotVBWRgXHv5Z4x9AgUIfIOPbbJcyG
 K4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OfK0tpH8kjdC9aBzVRfEMO2JK1yjN5Ywppuc5BMNAlk=;
 b=cXgfqEyAxoeICau/F8u2qod4mj4Pxiz/Zu4eQPkMIO6rtz4RWjofXdD85d90X08bsv
 njF5qqyfib7MIFRYKDlkoyCvgGsXC8/dc+0nMEsjrbQOcGhlsDa3kDPNYPt0wtixWIur
 SpOQcf+IiH3+eOgFbdRrmXH+b1NlHBiFnwH6lTfGzMzytQCl6NtKv+clPq2FpTgitk4W
 7ogfEcNzeEQczwCLpvePZIRQOVzw2kzFxLebz2xHH4naXHhZ0gbLFwFSfZ6flrrxBfnp
 28Xyme0DR3n8rLNYQS3gk0Y1M2lPLSEmq0LVvVbD145gEspGLZxYBnqYqQMtg8t988Ky
 fNYw==
X-Gm-Message-State: AOAM5317NJxxgSzHGgk0tGYjEfQorxpYYhI13AKIU6I5lBfLOoRHk3AI
 859gSXYMGxRcoyXnwTBqj4PNsFZgsmLNQ1jBWIn8+w==
X-Google-Smtp-Source: ABdhPJzBUuieShvMs1DnGCSDEbXdoma89RFUbZZE+ByU8fSZ14hp0IRrf2Vx+c2nvRmHjMngeES6o3xSHEQNeAOu7sc=
X-Received: by 2002:a25:b952:0:b0:644:f4a4:4c23 with SMTP id
 s18-20020a25b952000000b00644f4a44c23mr10764420ybm.171.1650769101726; Sat, 23
 Apr 2022 19:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_B683AC1146DB6A6ABB4D73697C0D6A1D7608@qq.com>
 <YlWBkyGeb2ZOGLKl@fyu1.sc.intel.com>
 <tencent_A9458C6CEBAADD361DA765356477B00E920A@qq.com>
 <tencent_8B6D7835F62688B4CD069C0EFC41B308B407@qq.com>
 <YllADL6uMoLllzQo@fyu1.sc.intel.com> <YmA4pbgevqln/jSO@myrica>
 <tencent_76E043C4D1B6A21A5253579A61034107EB06@qq.com>
 <tencent_7477100F8A445C6CAFA8F13601A55134480A@qq.com>
 <YmJ/WA6KAQU/xJjA@myrica>
 <tencent_A4E83BA6071B2204B6F5D4E69A50D21C1A09@qq.com>
 <YmLOznyBF0f7COYT@myrica>
 <tencent_2922DAB6F3D5789A1CD3A21A843B4007ED09@qq.com>
In-Reply-To: <tencent_2922DAB6F3D5789A1CD3A21A843B4007ED09@qq.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Sun, 24 Apr 2022 10:58:10 +0800
Message-ID: <CABQgh9GzuQqsuPVyur+QurN8p+1BciMfOw0TccwiZSvvtrcowg@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] iommu/sva: Assign a PASID to mm on PASID
 allocation and free it on mm exit
To: "zhangfei.gao@foxmail.com" <zhangfei.gao@foxmail.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, robin.murphy@arm.com,
 Dave Hansen <dave.hansen@linux.intel.com>, x86 <x86@kernel.org>,
 Fenghua Yu <fenghua.yu@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, iommu <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, will@kernel.org
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

T24gU2F0LCAyMyBBcHIgMjAyMiBhdCAxOToxMywgemhhbmdmZWkuZ2FvQGZveG1haWwuY29tCjx6
aGFuZ2ZlaS5nYW9AZm94bWFpbC5jb20+IHdyb3RlOgo+Cj4gSGksIEplYW4KPgo+IE9uIDIwMjIv
NC8yMiDkuIvljYgxMTo1MCwgSmVhbi1QaGlsaXBwZSBCcnVja2VyIHdyb3RlOgo+ID4gT24gRnJp
LCBBcHIgMjIsIDIwMjIgYXQgMDk6MTU6MDFQTSArMDgwMCwgemhhbmdmZWkuZ2FvQGZveG1haWwu
Y29tIHdyb3RlOgo+ID4+PiBJJ20gdHJ5aW5nIHRvIHBpZWNlIHRvZ2V0aGVyIHdoYXQgaGFwcGVu
cyBmcm9tIHRoZSBrZXJuZWwgcG9pbnQgb2Ygdmlldy4KPiA+Pj4KPiA+Pj4gKiBtYXN0ZXIgcHJv
Y2VzcyB3aXRoIG1tIEEgb3BlbnMgYSBxdWV1ZSBmZCB0aHJvdWdoIHVhY2NlLCB3aGljaCBjYWxs
cwo+ID4+PiAgICAgaW9tbXVfc3ZhX2JpbmRfZGV2aWNlKGRldiwgQSkgLT4gUEFTSUQgMQo+ID4+
Pgo+ID4+PiAqIG1hc3RlciBmb3JrcyBhbmQgZXhpdHMuIENoaWxkIChkYWVtb24pIGdldHMgbW0g
QiwgaW5oZXJpdHMgdGhlIHF1ZXVlIGZkLgo+ID4+PiAgICAgVGhlIGRldmljZSBpcyBzdGlsbCBi
b3VuZCB0byBtbSBBIHdpdGggUEFTSUQgMSwgc2luY2UgdGhlIHF1ZXVlIGZkIGlzCj4gPj4+ICAg
ICBzdGlsbCBvcGVuLgo+ID4+PiBXZSBkaXNjdXNzZWQgdGhpcyBiZWZvcmUsIGJ1dCBJIGRvbid0
IHJlbWVtYmVyIHdoZXJlIHdlIGxlZnQgb2ZmLiBUaGUKPiA+Pj4gY2hpbGQgY2FuJ3QgdXNlIHRo
ZSBxdWV1ZSBiZWNhdXNlIGl0cyBtYXBwaW5ncyBhcmUgbm90IGNvcGllZCBvbiBmb3JrKCksCj4g
Pj4+IGFuZCB0aGUgcXVldWUgaXMgc3RpbGwgYm91bmQgdG8gdGhlIHBhcmVudCBtbSBBLiBUaGUg
Y2hpbGQgZWl0aGVyIG5lZWRzIHRvCj4gPj4+IG9wZW4gYSBuZXcgcXVldWUgb3IgdGFrZSBvd25l
cnNoaXAgb2YgdGhlIG9sZCBvbmUgd2l0aCBhIG5ldyB1YWNjZSBpb2N0bC4KPiA+PiBZZXMsIGN1
cnJlbnRseSBuZ2lueCBhbGlnbmVkIHdpdGggdGhlIGNhc2UuCj4gPj4gQ2hpbGQgcHJvY2VzcyAo
d29ya2VyIHByb2Nlc3MpIHJlb3BlbiB1YWNjZSwKPiA+Pgo+ID4+IE1hc3RlciBwcm9jZXNzIChk
byBpbml0KSBvcGVuIHVhY2NlLCBpb21tdV9zdmFfYmluZF9kZXZpY2UoZGV2LCBBKSAtPiBQQVNJ
RAo+ID4+IDEKPiA+PiBNYXN0ZXIgcHJvY2VzcyBmb3JrIENoaWxkIChkYWVtb24pIGFuZCBleGl0
Lgo+ID4+Cj4gPj4gQ2hpbGQgKGRhZW1vbikgIGRvZXMgbm90IHVzZSBQQVNJRCAxIGFueSBtb3Jl
LCBvbmx5IGZvcmsgYW5kIG1hbmFnZSB3b3JrZXIKPiA+PiBwcm9jZXNzLgo+ID4+IFdvcmtlciBw
cm9jZXNzIHJlb3BlbiB1YWNjZSwgaW9tbXVfc3ZhX2JpbmRfZGV2aWNlKGRldiwgQikgUEFTSUQg
Mgo+ID4+Cj4gPj4gU28gaXQgaXMgZXhwZWN0ZWQuCj4gPiBZZXMsIHRoYXQncyBmaW5lCj4gPgo+
ID4+PiBJcyB0aGF0IHRoZSAiSU1QTEVNRU5UX0RZTkFNSUNfQklORF9GTigpIiB5b3UgbWVudGlv
biwgc29tZXRoaW5nIG91dCBvZgo+ID4+PiB0cmVlPyAgVGhpcyBvcGVyYXRpb24gc2hvdWxkIHVu
YmluZCBmcm9tIEEgYmVmb3JlIGJpbmRpbmcgdG8gQiwgbm8/Cj4gPj4+IE90aGVyd2lzZSB3ZSBs
ZWFrIFBBU0lEIDEuCj4gPj4gSW4gNS4xNiBQQVNJRCAxIGZyb20gbWFzdGVyIGlzIGhvbGQgdW50
aWwgbmdpbnggc2VydmljZSBzdG9wLgo+ID4+IG5naW54IHN0YXJ0Cj4gPj4gbWFzdGVyOgo+ID4+
IGlvbW11X3N2YV9hbGxvY19wYXNpZCBtbS0+cGFzaWQ9MSAgICAgIC8vIG1hc3RlciBwcm9jZXNz
Cj4gPj4KPiA+PiBseW54IGh0dHBzIHN0YXJ0Ogo+ID4+IGlvbW11X3N2YV9hbGxvY19wYXNpZCBt
bS0+cGFzaWQ9MiAgICAvL3dvcmtlciBwcm9jZXNzCj4gPj4KPiA+PiBuZ2lueCBzdG9wOiAgZnJv
bSBmb3BzX3JlbGVhc2UKPiA+PiBpb21tdV9zdmFfZnJlZV9wYXNpZCBtbS0+cGFzaWQ9MiAgIC8v
IHdvcmtlciBwcm9jZXNzCj4gPj4gaW9tbXVfc3ZhX2ZyZWVfcGFzaWQgbW0tPnBhc2lkPTEgIC8v
IG1hc3RlciBwcm9jZXNzCj4gPiBUaGF0J3MgdGhlIGV4cGVjdGVkIGJlaGF2aW9yIChtYXN0ZXIg
Y291bGQgY2xvc2UgaXRzIGZkIGJlZm9yZSBmb3JraW5nLCBpbgo+ID4gb3JkZXIgdG8gZnJlZSB0
aGluZ3MgdXAgZWFybGllciwgYnV0IGl0J3Mgbm90IG1hbmRhdG9yeSkKPiBDdXJyZW50bHkgd2Ug
dW5iaW5kIGluIGZvcHNfcmVsZWFzZSwgc28gdGhlIGlvYXNpZCBhbGxvY2F0ZWQgaW4gbWFzdGVy
Cj4gY2FuIG9ubHkgYmUgZnJlZWQgd2hlbiBuZ2lueCBzdG9wLAo+IHdoZW4gYWxsIGZvcmtlZCBm
ZCBhcmUgY2xvc2VkLgo+Cj4gPgo+ID4+IEhhdmUgb25lIHNpbGx5IHF1ZXN0aW9uLgo+ID4+Cj4g
Pj4ga2VybmUgZHJpdmVyCj4gPj4gZm9wc19vcGVuCj4gPj4gaW9tbXVfc3ZhX2JpbmRfZGV2aWNl
Cj4gPj4KPiA+PiBmb3BzX3JlbGVhc2UKPiA+PiBpb21tdV9zdmFfdW5iaW5kX2RldmljZQo+ID4+
Cj4gPj4gYXBwbGljYXRpb24KPiA+PiBtYWluKCkKPiA+PiBmZCA9IG9wZW4KPiA+PiByZXR1cm47
Cj4gPj4KPiA+PiBBcHBsaWNhdGlvbiBleGl0IGJ1dCBub3QgY2xvc2UoZmQpLCBpcyBpdCBleHBl
Y3RlZCBmb3BzX3JlbGVhc2Ugd2lsbCBiZQo+ID4+IGNhbGxlZCBhdXRvbWF0aWNhbGx5IGJ5IHN5
c3RlbT8KPiA+IFllcywgdGhlIGFwcGxpY2F0aW9uIGRvZXNuJ3QgaGF2ZSB0byBjYWxsIGNsb3Nl
KCkgZXhwbGljaXRseSwgdGhlIGZpbGUKPiA+IGRlc2NyaXB0b3IgaXMgY2xvc2VkIGF1dG9tYXRp
Y2FsbHkgb24gZXhpdC4gTm90ZSB0aGF0IHRoZSBmZCBpcyBjb3BpZWQgb24KPiA+IGZvcmsoKSwg
c28gaXQgaXMgb25seSByZWxlYXNlZCBvbmNlIHBhcmVudCBhbmQgYWxsIGNoaWxkIHByb2Nlc3Nl
cyBleGl0Lgo+IFllcywgaW4gY2FzZSB0aGUgYXBwbGljYXRpb24gZW5kZWQgdW5leHBlY3RlZCwg
bGlrZSBjdHJsK2MKPiA+Cj4gPj4gT24gNS4xNwo+ID4+IGZvcHNfcmVsZWFzZSBpcyBjYWxsZWQg
YXV0b21hdGljYWxseSwgYXMgd2VsbCBhcyBpb21tdV9zdmFfdW5iaW5kX2RldmljZS4KPiA+PiBP
biA1LjE4LXJjMS4KPiA+PiBmb3BzX3JlbGVhc2UgaXMgbm90IGNhbGxlZCwgaGF2ZSB0byBtYW51
YWxseSBjYWxsIGNsb3NlKGZkKQo+ID4gUmlnaHQgdGhhdCdzIHdlaXJkCj4gTG9va3MgaXQgaXMg
Y2F1c2VkIGJ5IHRoZSBmaXggcGF0Y2gsIHZpYSBtbWdldCwgd2hpY2ggbWF5IGFkZCByZWZjb3Vu
dAo+IG9mIGZkLgo+Cj4gU29tZSBleHBlcmltZW50cwo+IDEuIDUuMTcsIGV2ZXJ5dGhpbmcgd29y
a3Mgd2VsbC4KPgo+IDIuIDUuMTcgKyBwYXRjaHNldCBvZiAiaW9tbXUvc3ZhOiBBc3NpZ24gYSBQ
QVNJRCB0byBtbSBvbiBQQVNJRAo+IGFsbG9jYXRpb24gYW5kIGZyZWUgaXQgb24gbW0gZXhpdCIK
Pgo+IFRlc3QgYXBwbGljYXRpb24sIGV4aXQgd2l0aG91dCBjbG9zZSB1YWNjZSBmZAo+IEZpcnN0
IHRpbWU6ICBmb3BzX3JlbGVhc2UgY2FuIGJlIGNhbGxlZCBhdXRvbWF0aWNhbGx5Lgo+Cj4gbG9n
Ogo+IGlvYXNpZF9hbGxvYyBpb2FzaWQ9MQo+IGlvbW11X3N2YV9hbGxvY19wYXNpZCBwYXNpZD0x
Cj4gaW9tbXVfc3ZhX2JpbmRfZGV2aWNlIGhhbmRsZT0wMDAwMDAwMDI2M2EyZWU4Cj4gaW9hc2lk
X2ZyZWUgaW9hc2lkPTEKPiB1YWNjZV9mb3BzX3JlbGVhc2UgcT0wMDAwMDAwMDU1Y2EzY2RmCj4g
aW9tbXVfc3ZhX3VuYmluZF9kZXZpY2UgaGFuZGxlPTAwMDAwMDAwMjYzYTJlZTgKPgo+IFNlY29u
ZCB0aW1lOiBoYXJkd2FyZSByZXBvcnRzIGVycm9yCj4KPiB1YWNjZV9mb3BzX29wZW4gcT0wMDAw
MDAwMDhlNGQ2Zjc4Cj4gaW9hc2lkX2FsbG9jIGlvYXNpZD0xCj4gaW9tbXVfc3ZhX2FsbG9jX3Bh
c2lkIHBhc2lkPTEKPiBpb21tdV9zdmFfYmluZF9kZXZpY2UgaGFuZGxlPTAwMDAwMDAwY2ZkMTE3
ODgKPiAvLyBIYXJlZHdhcmUgcmVwb3J0cyBlcnJvcgo+IGhpc2lfc2VjMiAwMDAwOmI2OjAwLjA6
IHFtX2FjY19kb190YXNrX3RpbWVvdXQgW2Vycm9yIHN0YXR1cz0weDIwXSBmb3VuZAo+IGhpc2lf
c2VjMiAwMDAwOmI2OjAwLjA6IHFtX2FjY193Yl9ub3RfcmVhZHlfdGltZW91dCBbZXJyb3Igc3Rh
dHVzPTB4NDBdCj4gZm91bmQKPiBoaXNpX3NlYzIgMDAwMDpiNjowMC4wOiBzZWNfZnNtX2hiZWF0
X3JpbnQgW2Vycm9yIHN0YXR1cz0weDIwXSBmb3VuZAo+IGhpc2lfc2VjMiAwMDAwOmI2OjAwLjA6
IENvbnRyb2xsZXIgcmVzZXR0aW5nLi4uCj4gaGlzaV9zZWMyIDAwMDA6YjY6MDAuMDogUU0gbWFp
bGJveCBvcGVyYXRpb24gdGltZW91dCEKPiBoaXNpX3NlYzIgMDAwMDpiNjowMC4wOiBGYWlsZWQg
dG8gZHVtcCBzcWMhCj4gaGlzaV9zZWMyIDAwMDA6YjY6MDAuMDogRmFpbGVkIHRvIGRyYWluIG91
dCBkYXRhIGZvciBzdG9wcGluZyEKPiBoaXNpX3NlYzIgMDAwMDpiNjowMC4wOiBCdXMgbG9jayEg
UGxlYXNlIHJlc2V0IHN5c3RlbS4KPiBoaXNpX3NlYzIgMDAwMDpiNjowMC4wOiBDb250cm9sbGVy
IHJlc2V0IGZhaWxlZCAoLTExMCkKPiBoaXNpX3NlYzIgMDAwMDpiNjowMC4wOiBjb250cm9sbGVy
IHJlc2V0IGZhaWxlZCAoLTExMCkKPgo+IDMuIEFkZCB0aGUgZml4IHBhdGNoIG9mIHVzaW5nIG1t
Z2V0IGluIGJpbmQuCj4gVGVzdCBhcHBsaWNhdGlvbiwgZXhpdCB3aXRob3V0IGNsb3NlIHVhY2Nl
IGZkCj4KPiBmb3BzX3JlbGVhc2UgY2FuIE5PVCBiZSBjYWxsZWQgYXV0b21hdGljYWxseSwgbG9v
a3MgbW1nZXQgYWRkcyByZWZjb3VudAo+IG9mIGZkLgoKVGVzdCBhcHBsaWNhdGlvbiwgZXhpdCB3
aXRob3V0IGNsb3NpbmcgZmQuCj4gPj4ga2VybmVsIGRyaXZlcgo+ID4+IGZvcHNfb3Blbgo+ID4+
IGlvbW11X3N2YV9iaW5kX2RldmljZQo+ID4+Cj4gPj4gZm9wc19yZWxlYXNlCj4gPj4gaW9tbXVf
c3ZhX3VuYmluZF9kZXZpY2UKCjEuCjUuMTcga2VybmVsLCBubyBtbWdldCAmIG1tcHV0Cgp3ZF9y
ZWxlYXNlX3F1ZXVlIG5vIGNsb3NlCkNvbXByZXNzIGJ6PTUxMjAwMCBuYj0xw5cxMCwgc3BlZWQ9
MTM5LjUgTUIvcyAowrEwLjAlIE49MSkgb3ZlcmFsbD0xMjIuOQpNQi9zICjCsTAuMCUpClsgICAx
Ni4wNTI5ODldIGRvX2V4aXQgY3VycmVudD1kMzgwMDAwClsgICAxNi4wNTM4MjhdIG1tcHV0IGF0
b21pYz0xClsgICAxNi4wNTQ1MTFdICBfX21tcHV0IGF0b21pYz0wClsgICAxNi4wNzAzODJdIGV4
aXRfdGFza193b3JrClsgICAxNi4wNzA5ODFdIHVhY2NlX2ZvcHNfcmVsZWFzZSBjdXJyZW50PWQz
ODAwMDAKWyAgIDE2LjA3MTk5OV0gQ1BVOiAwIFBJRDogMTc2IENvbW06IHRlc3Rfc3ZhX3BlcmYg
Tm90IHRhaW50ZWQKNS4xNi4wLXJjMS0yNzM0Mi1nZTVmOWYzZjk5YTg4LWRpcnR5ICMyNDAKWyAg
IDE2LjA3NDAwN10gSGFyZHdhcmUgbmFtZTogUUVNVSBLVk0gVmlydHVhbCBNYWNoaW5lLCBCSU9T
IDAuMC4wIDAyLzA2LzIwMTUKWyAgIDE2LjA3NTUzMF0gQ2FsbCB0cmFjZToKWyAgIDE2LjA3NjA2
OV0gIGR1bXBfYmFja3RyYWNlKzB4MC8weDFhMApbICAgMTYuMDc2ODg3XSAgc2hvd19zdGFjaysw
eDIwLzB4MzAKWyAgIDE2LjA3NzYyOV0gIGR1bXBfc3RhY2tfbHZsKzB4OGMvMHhiOApbICAgMTYu
MDc4NDQxXSAgZHVtcF9zdGFjaysweDE4LzB4MzQKWyAgIDE2LjA3OTE3Nl0gIHVhY2NlX2ZvcHNf
cmVsZWFzZSsweDQ0LzB4ZGMKWyAgIDE2LjA4MDA2MF0gIF9fZnB1dCsweDc4LzB4MjQwClsgICAx
Ni4wODA3NDNdICBfX19fZnB1dCsweDE4LzB4MjgKWyAgIDE2LjA4MTQ0N10gIHRhc2tfd29ya19y
dW4rMHg4OC8weDE2MApbICAgMTYuMDgyMjU5XSAgZG9fZXhpdCsweDUyYy8weGE1MApbICAgMTYu
MDgyOTc0XSAgZG9fZ3JvdXBfZXhpdCsweDg0LzB4YTgKWyAgIDE2LjA4Mzc2OF0gIF9fd2FrZV91
cF9wYXJlbnQrMHgwLzB4MzgKWyAgIDE2LjA4NDU5N10gIGludm9rZV9zeXNjYWxsKzB4NGMvMHgx
MTAKWyAgIDE2LjA4NTQzNV0gIGVsMF9zdmNfY29tbW9uLmNvbnN0cHJvcC4wKzB4NjgvMHgxMjgK
WyAgIDE2LjA4NjUwMV0gIGRvX2VsMF9zdmMrMHgyYy8weDkwClsgICAxNi4wODcyNDNdICBlbDBf
c3ZjKzB4MjQvMHg3MApbICAgMTYuMDg3OTI4XSAgZWwwdF82NF9zeW5jX2hhbmRsZXIrMHhiMC8w
eGI4ClsgICAxNi4wODg4NTRdICBlbDB0XzY0X3N5bmMrMHgxYTAvMHgxYTQKWyAgIDE2LjA4OTc3
NV0gIGFybV9zbW11X3N2YV91bmJpbmQKWyAgIDE2LjA5MDU3N10gIGlvbW11X3N2YV9mcmVlX3Bh
c2lkIG1tLT5wYXNpZD0xClsgICAxNi4wOTE3NjNdIGV4aXRfdGFza193b3JrIGRvbmUKCjIuIEFk
ZCBtbWdldCBpbiBiaW5kIGFuZCBtbXB1dCBpbiB1bmJpbmQsClNpbmNlIGFwcGxpY2F0aW9uIGRv
IG5vdCBjbG9zZSBmZCwgc28gbm8gdW5iaW5kLCYgbW1wdXQKQW5kIGZvcHNfcmVsZWFzZSBpcyBu
b3QgY2FsbGVkIHNpbmNlIG1tX3VzZXJzIGFjY291bnQuCgpsb2c6ClsgIDEwMS42NDI2OTBdIG1t
cHV0IGF0b21pYz0zCndkX3JlbGVhc2VfcXVldWUgbm8gY2xvc2UKQ29tcHJlc3MgYno9NTEyMDAw
IG5iPTHDlzEwLCBzcGVlZD00MC4zIE1CL3MgKMKxMC4wJSBOPTEpIG92ZXJhbGw9MzguNwpNQi9z
ICjCsTAuMCUpClsgIDEwMS42NzExNjddIGRvX2V4aXQgY3VycmVudD1kOWRhZjQwClsgIDEwMS42
NzIwMDNdIG1tcHV0IGF0b21pYz0yClsgIDEwMS42NzI3MTJdIGV4aXRfdGFza193b3JrClsgIDEw
MS42NzMyOTJdIGV4aXRfdGFza193b3JrIGRvbmUKClRoYW5rcwoKCgo+Cj4gU28gdGhlIGZpeCBt
ZXRob2Qgb2YgdXNpbmcgbW1nZXQgYmxvY2tzIGZvcHNfcmVsZWFzZSB0byBiZSBjYWxsZWQgb25j
ZQo+IGZkIGlzIGNsb3NlZCB3aXRob3V0IHVuYmluZC4KPgo+ID4+IFNpbmNlIG5naW54IG1heSBo
YXZlIGEgaXNzdWUsIGl0IGRvZXMgbm90IGNhbGwgY2xvc2UoZmQpIHdoZW4gbmdpbnggLXMgcXVp
dC4KPiA+IEFuZCB5b3UncmUgc3VyZSB0aGF0IG5vbmUgb2YgdGhlIHByb2Nlc3NlcyBhcmUgc3Rp
bGwgYWxpdmUgb3IgaW4gem9tYmllCj4gPiBzdGF0ZT8gIEp1c3QgdG8gY292ZXIgZXZlcnkgcG9z
c2liaWxpdHkuCj4gSXQgY2FuIGFsc28gcmVwcm9kdWNlZCBieSBhIHNpbXBsZSBhcHBsaWNhdGlv
biBleGl0IHdpdGhvdXQgY2xvc2UodWFjY2VfZmQpCj4KPiBUaGFua3MKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9t
bXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
