Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 32400163C0E
	for <lists.iommu@lfdr.de>; Wed, 19 Feb 2020 05:30:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AA277203CE;
	Wed, 19 Feb 2020 04:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8a026fBmYhh; Wed, 19 Feb 2020 04:30:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B08BF2035D;
	Wed, 19 Feb 2020 04:30:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9465AC013E;
	Wed, 19 Feb 2020 04:30:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8456C013E
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 04:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9B44A2035D
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 04:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rofKjhj4khIU for <iommu@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 04:30:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 766152034C
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 04:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582086625;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgxnN8m0IaSHDswmS3MDLky8pW23nTl7g02o10qix7E=;
 b=fstZ5U4BBuKAUErhLkPfF+K0xBOkKPZxn+LL7pLiSLMNn6+JpDCzxJIsGJDEmvGkF0/v1O
 5R+5QhjXJMB+lsIXgk4qGRQIaibPXE9ka1Vb5FgwlhTVHzCHG6qln85jDQG+0SihIbxbjp
 ZwHU2kWaMxZd7rx4kKxIGR/2SoplXH8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-QnORBUvtMhekFrBQ_7Hxog-1; Tue, 18 Feb 2020 23:30:23 -0500
Received: by mail-qt1-f198.google.com with SMTP id t4so14706080qtd.3
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 20:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=RgxnN8m0IaSHDswmS3MDLky8pW23nTl7g02o10qix7E=;
 b=bhwXGEL01bojQqGYCSfKLlJhH5qPbCLGW2QjfHrbYqniA3dj50NtEW+CH5vxFnQOxo
 fD/+QS/UXDXIBqoKCnctebks8U7un/TDekcLnUYHMMzvY/7FjVp3FbEk5d9AJfd6PnHf
 zKqeZrEA8bsjSWhCyZlUww66T97q5XDzVYZTY9Fqbaak5L02abS6zMphGitbhHnafGby
 R/VWS94rJ4G1KLhKqW1YUfXs9snGvatEWlbt8ga/V5Z0tHZhS59SANn0vymEko1J/F4n
 hJzj90d7N0/mws8nQFXs32rUVmXvywrDdDOSB9Xsa368i86q2yswfiwFQ22xyCylk88p
 RsLw==
X-Gm-Message-State: APjAAAWggSUGcLTH0IQieIpn7N5Op2xZUd5AdH7a16NJibk8O2xPziQX
 xQtqtQBQ3LxeHKAUYtMxDCYpauVwbwrjyrPcA0XcaxYXa4b4sBfQ7MNCcD4eYU5WoyJfLjg/ICG
 pMzCeoFWCsS22xO82wELcMIetU5rolQ==
X-Received: by 2002:ad4:518d:: with SMTP id b13mr19283539qvp.141.1582086622771; 
 Tue, 18 Feb 2020 20:30:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqyRtef0X8HU0zwAsq/Lw8prnroszaPQ+YdTTy3H1KkD105e+lq/rFEFpxlYCTM+I9aDt+7L5A==
X-Received: by 2002:ad4:518d:: with SMTP id b13mr19283515qvp.141.1582086622400; 
 Tue, 18 Feb 2020 20:30:22 -0800 (PST)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id r12sm425983qkm.94.2020.02.18.20.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 20:30:21 -0800 (PST)
Date: Tue, 18 Feb 2020 21:30:20 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: dmar fault right around domain switch in iommu_need_mapping
Message-ID: <20200219043020.7tlj4f2ruwh52fjq@cantor>
References: <20200218154549.rcav24rkm7rc4hvp@cantor>
 <1215cfc2-cfa0-c0d7-01fb-8c5b12dd5a2e@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1215cfc2-cfa0-c0d7-01fb-8c5b12dd5a2e@linux.intel.com>
X-MC-Unique: QnORBUvtMhekFrBQ_7Hxog-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: iommu@lists.linux-foundation.org
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gV2VkIEZlYiAxOSAyMCwgTHUgQmFvbHUgd3JvdGU6Cj5IaSBKZXJyeSwKPgo+T24gMjAyMC8y
LzE4IDIzOjQ1LCBKZXJyeSBTbml0c2VsYWFyIHdyb3RlOgo+PkhpIEpvZXJnIGFuZCBCYW9sdSwK
Pj4KPj5JJ20gY2hhc2luZyBkb3duIG9uZSBsYXN0IGlzc3VlLiBJJ20gd2FpdGluZyB0byBoZWFy
IGJhY2sgZnJvbSB0aGVtCj4+dGVzdGluZyB3aXRoIEpvZXJnJ3MgcGF0Y2hzZXQsIGJ1dCBJJ20g
Z3Vlc3NpbmcgdGhpcyB3aWxsIHN0aWxsIHBvcAo+PnVwLiBJdCBsb29rcyBsaWtlIHJpZ2h0IGFy
b3VuZCB3aGVuIHRoZSBkb21haW4gc3dpdGNoIG9jY3VycyBpbgo+PmlvbW11X25lZWRfbWFwcGlu
ZyB0aGVyZSBhcmUgc29tZSBkbWFyIGZhdWx0cyAoYmVsb3cgaXMgZnJvbSA1LjYtcmMxCj4+cGx1
cyBlYXJsaWVyIGZpeCBhdHRlbXB0IHRoYXQgbW92ZWQgZGVmZXJyZWQgYXR0YWNoIHRvIGJlZ2lu
bmluZyBvZgo+PmlvbW11X25lZWRfbWFwcGluZyk6Cj4+Cj4+W8KgwqAgMTIuNTQ2OTIwXSBETUFS
OiBEUkhEOiBoYW5kbGluZyBmYXVsdCBzdGF0dXMgcmVnIDIKPj5bwqDCoCAxMi41NDY5MjNdIERN
QVI6IFtETUEgUmVhZF0gUmVxdWVzdCBkZXZpY2UgWzAyOjAwLjBdIFBBU0lEIAo+PmZmZmZmZmZm
IGZhdWx0IGFkZHIgNzkxZGQwMDAgW2ZhdWx0IHJlYXNvbiAwMl0gUHJlc2VudCBiaXQgaW4gCj4+
Y29udGV4dCBlbnRyeSBpcyBjbGVhcgo+PlvCoMKgIDEyLjYzNTE5M10gaHBzYSAwMDAwOjAyOjAw
LjA6IFVzaW5nIGlvbW11IGRtYSBtYXBwaW5nCj4+W8KgwqAgMTIuNzc2NzEyXSBocHNhIDAwMDA6
MDI6MDAuMDogRE1BUjogMzJiaXQgRE1BIHVzZXMgbm9uLWlkZW50aXR5IG1hcHBpbmcKPj4KPj5b
wqDCoCAxNC4wOTEyMTldIERNQVI6IFtETUEgUmVhZF0gUmVxdWVzdCBkZXZpY2UgWzA3OjAwLjBd
IFBBU0lEIAo+PmZmZmZmZmZmIGZhdWx0IGFkZHIgNzkxZGQwMDAgW2ZhdWx0IHJlYXNvbiAwMl0g
UHJlc2VudCBiaXQgaW4gCj4+Y29udGV4dCBlbnRyeSBpcyBjbGVhcgo+PlvCoMKgIDE0LjE4MDg0
Ml0gRE1BUjogRFJIRDogaGFuZGxpbmcgZmF1bHQgc3RhdHVzIHJlZyAyMDIKPj5bwqDCoCAxNC4x
ODA4NDVdIERNQVI6IFtETUEgUmVhZF0gUmVxdWVzdCBkZXZpY2UgWzA3OjAwLjBdIFBBU0lEIAo+
PmZmZmZmZmZmIGZhdWx0IGFkZHIgNzkxZGQwMDAgW2ZhdWx0IHJlYXNvbiAwMl0gUHJlc2VudCBi
aXQgaW4gCj4+Y29udGV4dCBlbnRyeSBpcyBjbGVhcgo+PlvCoMKgIDE0LjI2ODc1Nl0gRE1BUjog
RFJIRDogaGFuZGxpbmcgZmF1bHQgc3RhdHVzIHJlZyAzMDIKPj5bwqDCoCAxNS41NDI1NTFdIGhw
c2EgMDAwMDowNzowMC4wOiBVc2luZyBpb21tdSBkbWEgbWFwcGluZwo+PlvCoMKgIDE1LjU2NzI1
Nl0gaHBzYSAwMDAwOjA3OjAwLjA6IERNQVI6IDMyYml0IERNQSB1c2VzIG5vbi1pZGVudGl0eSBt
YXBwaW5nCj4+Cj4+Cj4+SXQgc2VlbXMgdG8gb25seSBoYXBwZW4gcmlnaHQgdGhlbiwgYW5kIHRo
ZW4gdGhpbmdzIGFyZSBmaW5lLiBIYXBwZW5zCj4+ZHVyaW5nIGJvdGggcmVndWxhciBhbmQga2R1
bXAgYm9vdC7CoCBXaXRoIHRoZSBrZHVtcCBib290IHRoZSBmYXVsdHMKPj5hcmUgZnJvbSB0aGUg
aHBpbG8gaW4gdGhlIGxvZ3MgSSdtIGxvb2tpbmcgYXQsIHNvIGl0IGRvZXNuJ3Qgc2VlbSB0bwo+
PmJlIHRpZWQgdG8gYSBkZXZpY2UsIG9yIGNlcnRhaW4gcm1yci4gVGhlIGZhdWx0aW5nIGFkZHJl
c3MgYWx3YXlzCj4+c2VlbXMgdG8gYmUgdGhlIGJhc2UgYWRkcmVzcyBvZiB0aGUgcm1yci7CoCBU
aGUgZG1hciB0YWJsZXMgbG9vayBzYW5lLgo+Cj5QZXJoYXBzIGxpa2UgdGhpcz8KPgo+VGhlIGRl
dmljZSB3YXMgYm9vdCB3aXRoIGFuIGlkZW50aXR5IGRvbWFpbiAoaW9tbXU9cHQpLiBXaGVuIGxv
YWRpbmcgdGhlCj5kcml2ZXIgZm9yIHRoaXMgZGV2aWNlLCBpb21tdSBkcml2ZXIgZmluZHMgdGhh
dCBpdCdzIGEgMzItYml0IGRldmljZSBhbmQKPnRyaWVzIHRvIGNvbnZlcnQgaXQgdG8gRE1BIGRv
bWFpbi4gVGhlIHJtcnIgaXMgc3RpbGwgYWN0aXZlIGR1cmluZyB0aGUKPnN3aXRjaCwgaGVuY2Ug
eW91IHNlZSBkbWEgZmF1bHRzIGR1cmluZyB0aGF0IHRpbWUgd2luZG93Lgo+Cj5CZXN0IHJlZ2Fy
ZHMsCj5iYW9sdQo+CgpJdCBsb29rcyBsaWtlIGl0IGRvZXNuJ3Qgb2NjdXIgd2l0aCBKb2VyZydz
IHBhdGNoc2V0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
