Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4192C30DC9
	for <lists.iommu@lfdr.de>; Fri, 31 May 2019 14:05:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 51AED1082;
	Fri, 31 May 2019 12:05:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 54B6B1065
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 12:05:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BAED05F4
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 12:05:02 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id j17so10765295itk.0
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 05:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tqrmQ2U13+xCmSb38oWvwz7Ya/O77rdp+A5n3MJMo9s=;
	b=EAVssgeGBCvIeN+LOaVQJhli9zK5WDpZ2PQL9gkDLY6QdVReJFS1rLxx9WjhOmAMmj
	v1vagOru+dq6oya+bCAnPtDOBj3bJSbfA4vB4ZivogSmc4lL8rRDf4cUZwkalajh+0a8
	OFJ9lBVSYOiTVx+6GPpK9ri0cAcGKqKbL4uYz+EYhQraAJ+jsdzRQcduU3Tu/kHNM7dY
	Jz5dXSxcfdm7acMdECPVKF+igmk9nVUz1yfu7+YC6sghTCUOPf/Edd4mhM6sOUyFkDwj
	pmLKBvxvT2XLiQ5xog/MWg1EIYec5M2Ig9isAg2bi7XneZaeNqljqC62/ZjW4KpqoUux
	Q7OA==
X-Gm-Message-State: APjAAAXWcl/VfojwHC3+vSH+qNjowFvSEV1K69JCt3pFxRSCFU+jWXAe
	WSeNFIQfqbCus6K637urDeW8QZjA0APYGm94GW4=
X-Google-Smtp-Source: APXvYqySiM9LW0NoBLx4rQzzZSpkGZOKNt7EZ4KDgWPh4CJ8HWvRwy6qvhRMJVkCU4IorVkpiTWZW/8PXo9JPFU0TFc=
X-Received: by 2002:a24:5a45:: with SMTP id v66mr6900489ita.140.1559304302034; 
	Fri, 31 May 2019 05:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190521161102.29620-1-peron.clem@gmail.com>
	<CAAObsKD8bij1ANLqX6y11Y6mDEXiymNjrDkmHmvGWiFLKWu_FA@mail.gmail.com>
	<4ff02295-6c34-791b-49f4-6558a92ad7a3@arm.com>
In-Reply-To: <4ff02295-6c34-791b-49f4-6558a92ad7a3@arm.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Fri, 31 May 2019 14:04:50 +0200
Message-ID: <CAAObsKBt1tPw9RKGi_Xey=1zy9Tu3N+A=1te2R8=NuJ5tDBqVg@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Allwinner H6 Mali GPU support
To: Robin Murphy <robin.murphy@arm.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
	David Airlie <airlied@linux.ie>, Will Deacon <will.deacon@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Steven Price <steven.price@arm.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
	=?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
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

T24gV2VkLCAyOSBNYXkgMjAxOSBhdCAxOTozOCwgUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlA
YXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAyOS8wNS8yMDE5IDE2OjA5LCBUb21ldSBWaXpvc28gd3Jv
dGU6Cj4gPiBPbiBUdWUsIDIxIE1heSAyMDE5IGF0IDE4OjExLCBDbMOpbWVudCBQw6lyb24gPHBl
cm9uLmNsZW1AZ21haWwuY29tPiB3cm90ZToKPiA+Pgo+ID4gW3NuaXBdCj4gPj4gWyAgMzQ1LjIw
NDgxM10gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IG1tdSBpcnEgc3RhdHVzPTEKPiA+PiBbICAzNDUu
MjA5NjE3XSBwYW5mcm9zdCAxODAwMDAwLmdwdTogVW5oYW5kbGVkIFBhZ2UgZmF1bHQgaW4gQVMw
IGF0IFZBCj4gPj4gMHgwMDAwMDAwMDAyNDAwNDAwCj4gPgo+ID4gIEZyb20gd2hhdCBJIGNhbiBz
ZWUgaGVyZSwgMHgwMDAwMDAwMDAyNDAwNDAwIHBvaW50cyB0byB0aGUgZmlyc3QgYnl0ZQo+ID4g
b2YgdGhlIGZpcnN0IHN1Ym1pdHRlZCBqb2IgZGVzY3JpcHRvci4KPiA+Cj4gPiBTbyBtYXBwaW5n
IGJ1ZmZlcnMgZm9yIHRoZSBHUFUgZG9lc24ndCBzZWVtIHRvIGJlIHdvcmtpbmcgYXQgYWxsIG9u
Cj4gPiA2NC1iaXQgVC03NjAuCj4gPgo+ID4gU3RldmVuLCBSb2JpbiwgZG8geW91IGhhdmUgYW55
IGlkZWEgb2Ygd2h5IHRoaXMgY291bGQgYmU/Cj4KPiBJIHRyaWVkIHJvbGxpbmcgYmFjayB0byB0
aGUgb2xkIHBhbmZyb3N0L25vbmRybSBzaGltLCBhbmQgaXQgd29ya3MgZmluZQo+IHdpdGgga2Jh
c2UsIGFuZCBJIGFsc28gZm91bmQgdGhhdCBULTgyMCBmYWxscyBvdmVyIGluIHRoZSBleGFjdCBz
YW1lCj4gbWFubmVyLCBzbyB0aGUgZmFjdCB0aGF0IGl0IHNlZW1lZCB0byBiZSBjb21tb24gdG8g
dGhlIHNtYWxsZXIgMzMtYml0Cj4gZGVzaWducyByYXRoZXIgdGhhbiBhbnl0aGluZyB0byBkbyB3
aXRoIHRoZSBvdGhlcgo+IGpvYl9kZXNjcmlwdG9yX3NpemUvdjQvdjUgY29tcGxpY2F0aW9uIHR1
cm5lZCBvdXQgdG8gYmUgdGVsbGluZy4KCklzIHRoaXMgY29tcGxpY2F0aW9uIHNvbWV0aGluZyB5
b3UgY2FuIGV4cGxhaW4/IEkgZG9uJ3Qga25vdyB3aGF0IHY0CmFuZCB2NSBhcmUgbWVhbnQgaGVy
ZS4KCj4gWyBhcyBhbiBhc2lkZSwgYXJlIDY0LWJpdCBqb2JzIGFjdHVhbGx5IGtub3duIG5vdCB0
byB3b3JrIG9uIHY0IEdQVXMsIG9yCj4gaXMgaXQganVzdCB0aGF0IG5vYm9keSdzIHlldCBvYnNl
cnZlZCBhIDY0LWJpdCBibG9iIGRyaXZpbmcgb25lPyBdCgpJJ20gbG9va2luZyByaWdodCBub3cg
YXQgZ2V0dGluZyBQYW5mcm9zdCB3b3JraW5nIG9uIFQ3MjAgd2l0aCA2NC1iaXQKZGVzY3JpcHRv
cnMsIHdpdGggdGhlIHVsdGltYXRlIGdvYWwgb2YgbWFraW5nIFBhbmZyb3N0CjY0LWJpdC1kZXNj
cmlwdG9yIG9ubHkgc28gd2UgY2FuIGhhdmUgYSBzaW5nbGUgYnVpbGQgb2YgTWVzYSBpbgpkaXN0
cm9zLgoKPiBMb25nIHN0b3J5IHNob3J0LCBpdCBhcHBlYXJzIHRoYXQgJ01hbGkgTFBBRScgaXMg
YWxzbyBsYWNraW5nIHRoZSBzdGFydAo+IGxldmVsIG5vdGlvbiBvZiBWTVNBLCBhbmQgZXhwZWN0
cyBhIGZ1bGwgNC1sZXZlbCB0YWJsZSBldmVuIGZvciA8NDAgYml0cwo+IHdoZW4gbGV2ZWwgMCBl
ZmZlY3RpdmVseSByZWR1bmRhbnQuIFRodXMgd2Fsa2luZyB0aGUgMy1sZXZlbCB0YWJsZSB0aGF0
Cj4gaW8tcGd0YWJsZSBjb21lcyBiYWNrIHdpdGggZW5kcyB1cCBnb2luZyB3aWxkbHkgd3Jvbmcu
IFRoZSBoYWNrIGJlbG93Cj4gc2VlbXMgdG8gZG8gdGhlIGpvYiBmb3IgbWU7IGlmIENsw6ltZW50
IGNhbiBjb25maXJtIChvbiBULTcyMCB5b3UnbGwKPiBzdGlsbCBuZWVkIHRoZSB1c2Vyc3BhY2Ug
aGFjayB0byBmb3JjZSAzMi1iaXQgam9icyBhcyB3ZWxsKSB0aGVuIEkgdGhpbmsKPiBJJ2xsIGNv
b2sgdXAgYSBwcm9wZXIgcmVmYWN0b3Jpbmcgb2YgdGhlIGFsbG9jYXRvciB0byBwdXQgdGhpbmdz
IHJpZ2h0LgoKTW1hcHMgc2VlbSB0byB3b3JrIHdpdGggdGhpcyBwYXRjaCwgdGhhbmtzLgoKVGhl
IG1haW4gY29tcGxpY2F0aW9uIEknbSBmYWNpbmcgcmlnaHQgbm93IHNlZW1zIHRvIGJlIHRoYXQg
dGhlIFNGQkQKZGVzY3JpcHRvciBvbiBUNzIwIHNlZW1zIHRvIGJlIGRpZmZlcmVudCBmcm9tIHRo
ZSBvbmUgd2UgYWxyZWFkeSBoYWQKKHRlc3RlZCBvbiBUNnh4PykuCgpDaGVlcnMsCgpUb21ldQoK
PiBSb2Jpbi4KPgo+Cj4gLS0tLS0+OC0tLS0tCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUv
aW8tcGd0YWJsZS1hcm0uYyBiL2RyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1hcm0uYwo+IGluZGV4
IDU0Njk2OGQ4YTM0OS4uZjI5ZGE2ZThkYzA4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW9tbXUv
aW8tcGd0YWJsZS1hcm0uYwo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1hcm0uYwo+
IEBAIC0xMDIzLDEyICsxMDIzLDE0IEBAIGFybV9tYWxpX2xwYWVfYWxsb2NfcGd0YWJsZShzdHJ1
Y3QKPiBpb19wZ3RhYmxlX2NmZyAqY2ZnLCB2b2lkICpjb29raWUpCj4gICAgICAgICBpb3AgPSBh
cm1fNjRfbHBhZV9hbGxvY19wZ3RhYmxlX3MxKGNmZywgY29va2llKTsKPiAgICAgICAgIGlmIChp
b3ApIHsKPiAgICAgICAgICAgICAgICAgdTY0IG1haXIsIHR0YnI7Cj4gKyAgICAgICAgICAgICAg
IHN0cnVjdCBhcm1fbHBhZV9pb19wZ3RhYmxlICpkYXRhID0gaW9fcGd0YWJsZV9vcHNfdG9fZGF0
YSgmaW9wLT5vcHMpOwo+Cj4gKyAgICAgICAgICAgICAgIGRhdGEtPmxldmVscyA9IDQ7Cj4gICAg
ICAgICAgICAgICAgIC8qIENvcHkgdmFsdWVzIGFzIHVuaW9uIGZpZWxkcyBvdmVybGFwICovCj4g
ICAgICAgICAgICAgICAgIG1haXIgPSBjZmctPmFybV9scGFlX3MxX2NmZy5tYWlyWzBdOwo+ICAg
ICAgICAgICAgICAgICB0dGJyID0gY2ZnLT5hcm1fbHBhZV9zMV9jZmcudHRiclswXTsKPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxp
c3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
