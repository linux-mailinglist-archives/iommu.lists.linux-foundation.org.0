Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F24A16A766
	for <lists.iommu@lfdr.de>; Mon, 24 Feb 2020 14:40:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 32FE785C50;
	Mon, 24 Feb 2020 13:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jUmCD9xF1fxO; Mon, 24 Feb 2020 13:40:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6159785C28;
	Mon, 24 Feb 2020 13:40:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BB50C1D89;
	Mon, 24 Feb 2020 13:40:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93AEDC07FF
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 13:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 30EE61FEED
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 13:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXyDEj-oDU1t for <iommu@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:40:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id DD3A6203F4
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582551638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZLvpz3KL3hcQZqXig2m3yrQ87ZacoCyeVdZ86y6lXs=;
 b=GRJT1aNA/k3cgdp8pcMfOsHvU5zEKQtQVBHdSqxi9Q+ez6yqlSs+CTcFDadigBfa98p1/p
 N7ze/ZtMye9xJ4Ec5UEySIWhhrUu6Hq/+s/x1HKPVx9fOduIfdzw+rPN/R1XglareXe1NO
 j1eripHzNYBnz6bkExffltp717WO0VY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-4g2leM5lM6ScUOAAsOvjdA-1; Mon, 24 Feb 2020 08:40:37 -0500
X-MC-Unique: 4g2leM5lM6ScUOAAsOvjdA-1
Received: by mail-qt1-f199.google.com with SMTP id o24so10690619qtr.17
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 05:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PZLvpz3KL3hcQZqXig2m3yrQ87ZacoCyeVdZ86y6lXs=;
 b=MDjUosHkSWnHY6tBaTVVPwlvYPjRkSZhQjfzJJEsXMu636KSNNiJBgr1NpWml9XaRu
 E4Vw3iGMJQMNhANHhCGV+UhVkWPRG65KAeFnu1alxPAmfMq0mJCni2KauFk1lSC36yTW
 cJajNza3ff2uy8qR0IOQ+eGM3aSNGX9oKLgcosVsiTVNl/ko5uwszEbCbmmpIQThI4oS
 6V4H6Cx5SmNZ4x38pQ0m88+2NupCNA0WTBT+7cLkFyZppVOjlW6rrpEobl9iOATXEGcG
 cdYjpeZh+S0JUDnU4v/pIpxl1Y2fBh0lk50a1kaLBuzxa+GcpKI8CK/mRIQmY0QtBy3b
 KY/Q==
X-Gm-Message-State: APjAAAUe1kdQGWvK50l2PW2S5hiRj7s6pf8svzkzObXcrbwBsjyz035x
 h7fu1Had48tMsxUbgsMAyQJPRhVx+gKYQ4jPjhAaDOt9ip9IxMzZb7LMYDNmj/Y+fqrmZ68cUfo
 oQkhJ5RySqLONYZafabUxa+tJWcZUzQ==
X-Received: by 2002:ac8:7550:: with SMTP id b16mr157576qtr.114.1582551636540; 
 Mon, 24 Feb 2020 05:40:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqyt6oN5U/oTa2csPXnfRXiMAKAD9AwlAa2uq7VfRJWX7cd4YRox+4h9pKNIpt/2MVkBYa2GaQ==
X-Received: by 2002:ac8:7550:: with SMTP id b16mr157532qtr.114.1582551636198; 
 Mon, 24 Feb 2020 05:40:36 -0800 (PST)
Received: from redhat.com (bzq-79-178-2-214.red.bezeqint.net. [79.178.2.214])
 by smtp.gmail.com with ESMTPSA id
 a192sm5892195qkb.53.2020.02.24.05.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 05:40:35 -0800 (PST)
Date: Mon, 24 Feb 2020 08:40:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/2] virtio: decouple protected guest RAM form
 VIRTIO_F_IOMMU_PLATFORM
Message-ID: <20200224083845-mutt-send-email-mst@kernel.org>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <426e6972-0565-c931-e171-da0f58fbf856@redhat.com>
 <20200221155602.4de41fa7.pasic@linux.ibm.com>
 <0181712c-e533-fcfd-2638-8a0649d713dd@redhat.com>
 <20200224010607-mutt-send-email-mst@kernel.org>
 <b3c52c67-c740-a50e-2595-fe04d179c881@redhat.com>
 <20200224024641-mutt-send-email-mst@kernel.org>
 <08d6bdfb-9b49-c278-3c0b-2e02376cf0cf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <08d6bdfb-9b49-c278-3c0b-2e02376cf0cf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, David Gibson <david@gibson.dropbear.id.au>,
 Michael Mueller <mimu@linux.ibm.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDU6MjY6MjBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzIvMjQg5LiL5Y2IMzo0OCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDI6NDU6MDNQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAyMC8yLzI0IOS4i+WNiDI6MDYsIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEZlYiAyNCwgMjAyMCBhdCAxMjowMTo1N1BNICswODAw
LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gT24gMjAyMC8yLzIxIOS4i+WNiDEwOjU2LCBI
YWxpbCBQYXNpYyB3cm90ZToKPiA+ID4gPiA+ID4gT24gRnJpLCAyMSBGZWIgMjAyMCAxNDoyMjoy
NiArMDgwMAo+ID4gPiA+ID4gPiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90
ZToKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gT24gMjAyMC8yLzIxIOS4iuWNiDEyOjA2LCBI
YWxpbCBQYXNpYyB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IEN1cnJlbnRseSBpZiBvbmUgaW50ZW5k
cyB0byBydW4gYSBtZW1vcnkgcHJvdGVjdGlvbiBlbmFibGVkIFZNIHdpdGgKPiA+ID4gPiA+ID4g
PiA+IHZpcnRpbyBkZXZpY2VzIGFuZCBsaW51eCBhcyB0aGUgZ3Vlc3QgT1MsIG9uZSBuZWVkcyB0
byBzcGVjaWZ5IHRoZQo+ID4gPiA+ID4gPiA+ID4gVklSVElPX0ZfSU9NTVVfUExBVEZPUk0gZmxh
ZyBmb3IgZWFjaCB2aXJ0aW8gZGV2aWNlIHRvIG1ha2UgdGhlIGd1ZXN0Cj4gPiA+ID4gPiA+ID4g
PiBsaW51eCB1c2UgdGhlIERNQSBBUEksIHdoaWNoIGluIHR1cm4gaGFuZGxlcyB0aGUgbWVtb3J5
Cj4gPiA+ID4gPiA+ID4gPiBlbmNyeXB0aW9uL3Byb3RlY3Rpb24gc3R1ZmYgaWYgdGhlIGd1ZXN0
IGRlY2lkZXMgdG8gdHVybiBpdHNlbGYgaW50bwo+ID4gPiA+ID4gPiA+ID4gYSBwcm90ZWN0ZWQg
b25lLiBUaGlzIGhvd2V2ZXIgbWFrZXMgbm8gc2Vuc2UgZHVlIHRvIG11bHRpcGxlIHJlYXNvbnM6
Cj4gPiA+ID4gPiA+ID4gPiAqIFRoZSBkZXZpY2UgaXMgbm90IGNoYW5nZWQgYnkgdGhlIGZhY3Qg
dGhhdCB0aGUgZ3Vlc3QgUkFNIGlzCj4gPiA+ID4gPiA+ID4gPiBwcm90ZWN0ZWQuIFRoZSBzbyBj
YWxsZWQgSU9NTVUgYnlwYXNzIHF1aXJrIGlzIG5vdCBhZmZlY3RlZC4KPiA+ID4gPiA+ID4gPiA+
ICogVGhpcyB1c2FnZSBpcyBub3QgY29uZ3J1ZW50IHdpdGggIHN0YW5kYXJkaXNlZCBzZW1hbnRp
Y3Mgb2YKPiA+ID4gPiA+ID4gPiA+IFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNLiBHdWVzdCBtZW1v
cnkgcHJvdGVjdGVkIGlzIGFuIG9ydGhvZ29uYWwgcmVhc29uCj4gPiA+ID4gPiA+ID4gPiBmb3Ig
dXNpbmcgRE1BIEFQSSBpbiB2aXJ0aW8gKG9ydGhvZ29uYWwgd2l0aCByZXNwZWN0IHRvIHdoYXQg
aXMKPiA+ID4gPiA+ID4gPiA+IGV4cHJlc3NlZCBieSBWSVJUSU9fRl9JT01NVV9QTEFURk9STSku
Cj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IFRoaXMgc2VyaWVzIGFpbXMgdG8gZGVj
b3VwbGUgJ2hhdmUgdG8gdXNlIERNQSBBUEkgYmVjYXVzZSBteSAoZ3Vlc3QpIFJBTQo+ID4gPiA+
ID4gPiA+ID4gaXMgcHJvdGVjdGVkJyBhbmQgJ2hhdmUgdG8gdXNlIERNQSBBUEkgYmVjYXVzZSB0
aGUgZGV2aWNlIHRvbGQgbWUKPiA+ID4gPiA+ID4gPiA+IFZJUlRJT19GX0lPTU1VX1BMQVRGT1JN
Jy4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gUGxlYXNlIGZpbmQgbW9yZSBkZXRh
aWxlZCBleHBsYW5hdGlvbnMgYWJvdXQgdGhlIGNvbmNlcHR1YWwgYXNwZWN0cyBpbgo+ID4gPiA+
ID4gPiA+ID4gdGhlIGluZGl2aWR1YWwgcGF0Y2hlcy4gVGhlcmUgaXMgaG93ZXZlciBhbHNvIGEg
dmVyeSBwcmFjdGljYWwgcHJvYmxlbQo+ID4gPiA+ID4gPiA+ID4gdGhhdCBpcyBhZGRyZXNzZWQg
YnkgdGhpcyBzZXJpZXMuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEZvciB2aG9z
dC1uZXQgdGhlIGZlYXR1cmUgVklSVElPX0ZfSU9NTVVfUExBVEZPUk0gaGFzIHRoZSBmb2xsb3dp
bmcgc2lkZQo+ID4gPiA+ID4gPiA+ID4gZWZmZWN0IFRoZSB2aG9zdCBjb2RlIGFzc3VtZXMgaXQg
dGhlIGFkZHJlc3NlcyBvbiB0aGUgdmlydGlvIGRlc2NyaXB0b3IKPiA+ID4gPiA+ID4gPiA+IHJp
bmcgYXJlIG5vdCBndWVzdCBwaHlzaWNhbCBhZGRyZXNzZXMgYnV0IGlvdmEncywgYW5kIGluc2lz
dHMgb24gZG9pbmcgYQo+ID4gPiA+ID4gPiA+ID4gdHJhbnNsYXRpb24gb2YgdGhlc2UgcmVnYXJk
bGVzcyBvZiB3aGF0IHRyYW5zcG9ydCBpcyB1c2VkIChlLmcuIHdoZXRoZXIKPiA+ID4gPiA+ID4g
PiA+IHdlIGVtdWxhdGUgYSBQQ0kgb3IgYSBDQ1cgZGV2aWNlKS4gKEZvciBkZXRhaWxzIHNlZSBj
b21taXQgNmIxZTZjYzc4NTViCj4gPiA+ID4gPiA+ID4gPiAidmhvc3Q6IG5ldyBkZXZpY2UgSU9U
TEIgQVBJIi4pIE9uIHMzOTAgdGhpcyByZXN1bHRzIGluIHNldmVyZQo+ID4gPiA+ID4gPiA+ID4g
cGVyZm9ybWFuY2UgZGVncmFkYXRpb24gKGMuYS4gZmFjdG9yIDEwKS4KPiA+ID4gPiA+ID4gPiBE
byB5b3Ugc2VlIGEgY29uc2lzdGVudCBkZWdyYWRhdGlvbiBvbiB0aGUgcGVyZm9ybWFuY2UsIG9y
IGl0IG9ubHkKPiA+ID4gPiA+ID4gPiBoYXBwZW4gd2hlbiBmb3IgZHVyaW5nIHRoZSBiZWdpbm5p
bmcgb2YgdGhlIHRlc3Q/Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEFGQUlLIHRoZSBkZWdy
YWRhdGlvbiBpcyBjb25zaXN0ZW50Lgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEJUVyB3
aXRoIGNjdyBJL08gdGhlcmUgaXMKPiA+ID4gPiA+ID4gPiA+IChhcmNoaXRlY3R1cmFsbHkpIG5v
IElPTU1VLCBzbyB0aGUgd2hvbGUgYWRkcmVzcyB0cmFuc2xhdGlvbiBtYWtlcyBubwo+ID4gPiA+
ID4gPiA+ID4gc2Vuc2UgaW4gdGhlIGNvbnRleHQgb2YgdmlydGlvLWNjdy4KPiA+ID4gPiA+ID4g
PiBJIHN1c3BlY3Qgd2UgY2FuIGRvIG9wdGltaXphdGlvbiBpbiBxZW11IHNpZGUuCj4gPiA+ID4g
PiA+ID4gCj4gPiA+ID4gPiA+ID4gRS5nIHNlbmQgbWVtdGFibGUgZW50cnkgdmlhIElPVExCIEFQ
SSB3aGVuIHZJT01NVSBpcyBub3QgZW5hYmxlZC4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
PiBJZiB0aGlzIG1ha2VzIHNlbnNlLCBJIGNhbiBkcmFmdCBwYXRjaCB0byBzZWUgaWYgdGhlcmUn
cyBhbnkgZGlmZmVyZW5jZS4KPiA+ID4gPiA+ID4gRnJhbmtseSBJIHdvdWxkIHByZWZlciB0byBh
dm9pZCBJT1ZBcyBvbiB0aGUgZGVzY3JpcHRvciByaW5nIChhbmQgdGhlCj4gPiA+ID4gPiA+IHRo
ZW4gbmVjZXNzYXJ5IHRyYW5zbGF0aW9uKSBmb3IgdmlydGlvLWNjdyBhbHRvZ2V0aGVyLiBCdXQg
TWljaGFlbAo+ID4gPiA+ID4gPiB2b2ljZWQgaGlzIG9waW5pb24gdGhhdCB3ZSBzaG91bGQgbWFu
ZGF0ZSBGX0lPTU1VX1BMQVRGT1JNIGZvciBkZXZpY2VzCj4gPiA+ID4gPiA+IHRoYXQgY291bGQg
YmUgdXNlZCB3aXRoIGd1ZXN0cyBydW5uaW5nIGluIHByb3RlY3RlZCBtb2RlLiBJIGRvbid0IHNo
YXJlCj4gPiA+ID4gPiA+IGhpcyBvcGluaW9uLCBidXQgdGhhdCdzIGFuIG9uZ29pbmcgZGlzY3Vz
c2lvbi4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFNob3VsZCB3ZSBlbmQgdXAgaGF2aW5nIHRv
IGRvIHRyYW5zbGF0aW9uIGZyb20gSU9WQSBpbiB2aG9zdCwgd2UgYXJlCj4gPiA+ID4gPiA+IHZl
cnkgaW50ZXJlc3RlZCBpbiB0aGF0IHRyYW5zbGF0aW9uIGJlaW5nIGZhc3QgYW5kIGVmZmljaWVu
dC4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEluIHRoYXQgc2Vuc2Ugd2Ugd291bGQgYmUgdmVy
eSBoYXBweSB0byB0ZXN0IGFueSBvcHRpbWl6YXRpb24gdGhhdCBhaW0KPiA+ID4gPiA+ID4gaW50
byB0aGF0IGRpcmVjdGlvbi4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRoYW5rIHlvdSB2ZXJ5
IG11Y2ggZm9yIHlvdXIgaW5wdXQhCj4gPiA+ID4gPiBVc2luZyBJT1RMQiBBUEkgb24gcGxhdGZv
cm0gd2l0aG91dCBJT01NVSBzdXBwb3J0IGlzIG5vdCBpbnRlbmRlZC4gUGxlYXNlCj4gPiA+ID4g
PiB0cnkgdGhlIGF0dGFjaGVkIHBhdGNoIHRvIHNlZSBpZiBpdCBoZWxwcy4KPiA+ID4gPiA+IAo+
ID4gPiA+ID4gVGhhbmtzCj4gPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBSZWdhcmRz
LAo+ID4gPiA+ID4gPiBIYWxpbAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUaGFua3MKPiA+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEhhbGlsIFBhc2ljICgy
KToKPiA+ID4gPiA+ID4gPiA+ICAgICAgIG1tOiBtb3ZlIGZvcmNlX2RtYV91bmVuY3J5cHRlZCgp
IHRvIG1lbV9lbmNyeXB0LmgKPiA+ID4gPiA+ID4gPiA+ICAgICAgIHZpcnRpbzogbGV0IHZpcnRp
byB1c2UgRE1BIEFQSSB3aGVuIGd1ZXN0IFJBTSBpcyBwcm90ZWN0ZWQKPiA+ID4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiA+ID4gICAgICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIHwgIDMg
KysrCj4gPiA+ID4gPiA+ID4gPiAgICAgIGluY2x1ZGUvbGludXgvZG1hLWRpcmVjdC5oICAgfCAg
OSAtLS0tLS0tLS0KPiA+ID4gPiA+ID4gPiA+ICAgICAgaW5jbHVkZS9saW51eC9tZW1fZW5jcnlw
dC5oICB8IDEwICsrKysrKysrKysKPiA+ID4gPiA+ID4gPiA+ICAgICAgMyBmaWxlcyBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IGJhc2UtY29tbWl0OiBjYTdlMWZkMTAyNmM1YWY2
YTUzM2I0YjU0NDdlMWQyZjE1M2UyOGYyCj4gPiA+ID4gPiA+RnJvbSA2NmZhNzMwNDYwODc1YWM5
OWU4MWQ3ZGIyMzM0Y2QxNmJiMWQyYjI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gPiA+
ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiA+ID4gPiA+IERhdGU6
IE1vbiwgMjQgRmViIDIwMjAgMTI6MDA6MTAgKzA4MDAKPiA+ID4gPiA+IFN1YmplY3Q6IFtQQVRD
SF0gdmlydGlvOiB0dXJuIG9uIElPTU1VX1BMQVRGT1JNIHByb3Blcmx5Cj4gPiA+ID4gPiAKPiA+
ID4gPiA+IFdoZW4gdHJhbnNwb3J0IGRvZXMgbm90IHN1cHBvcnQgSU9NTVUsIHdlIHNob3VsZCBj
bGVhciBJT01NVV9QTEFURk9STQo+ID4gPiA+ID4gZXZlbiBpZiB0aGUgZGV2aWNlIGFuZCB2aG9z
dCBjbGFpbXMgdG8gc3VwcG9ydCB0aGF0LiBUaGlzIGhlbHAgdG8KPiA+ID4gPiA+IGF2b2lkIHRo
ZSBwZXJmb3JtYW5jZSBvdmVyaGVhZCBjYXVzZWQgYnkgdW5uZWNlc3NhcnkgSU9UTEIgbWlzcy91
cGRhdGUKPiA+ID4gPiA+IHRyYW5zYWN0aW9ucyBvbiBzdWNoIHBsYXRmb3JtLgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29t
Pgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgICBody92aXJ0aW8vdmlydGlvLWJ1cy5jIHwgNiAr
KystLS0KPiA+ID4gPiA+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gPiA+ID4gPiAKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9ody92aXJ0aW8vdmly
dGlvLWJ1cy5jIGIvaHcvdmlydGlvL3ZpcnRpby1idXMuYwo+ID4gPiA+ID4gaW5kZXggZDYzMzJk
NDVjMy4uMjc0MWI5ZmRkMiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2h3L3ZpcnRpby92aXJ0aW8t
YnVzLmMKPiA+ID4gPiA+ICsrKyBiL2h3L3ZpcnRpby92aXJ0aW8tYnVzLmMKPiA+ID4gPiA+IEBA
IC00Nyw3ICs0Nyw2IEBAIHZvaWQgdmlydGlvX2J1c19kZXZpY2VfcGx1Z2dlZChWaXJ0SU9EZXZp
Y2UgKnZkZXYsIEVycm9yICoqZXJycCkKPiA+ID4gPiA+ICAgICAgICBWaXJ0aW9CdXNTdGF0ZSAq
YnVzID0gVklSVElPX0JVUyhxYnVzKTsKPiA+ID4gPiA+ICAgICAgICBWaXJ0aW9CdXNDbGFzcyAq
a2xhc3MgPSBWSVJUSU9fQlVTX0dFVF9DTEFTUyhidXMpOwo+ID4gPiA+ID4gICAgICAgIFZpcnRp
b0RldmljZUNsYXNzICp2ZGMgPSBWSVJUSU9fREVWSUNFX0dFVF9DTEFTUyh2ZGV2KTsKPiA+ID4g
PiA+IC0gICAgYm9vbCBoYXNfaW9tbXUgPSB2aXJ0aW9faG9zdF9oYXNfZmVhdHVyZSh2ZGV2LCBW
SVJUSU9fRl9JT01NVV9QTEFURk9STSk7Cj4gPiA+ID4gPiAgICAgICAgRXJyb3IgKmxvY2FsX2Vy
ciA9IE5VTEw7Cj4gPiA+ID4gPiAgICAgICAgRFBSSU5URigiJXM6IHBsdWcgZGV2aWNlLlxuIiwg
cWJ1cy0+bmFtZSk7Cj4gPiA+ID4gPiBAQCAtNzcsMTAgKzc2LDExIEBAIHZvaWQgdmlydGlvX2J1
c19kZXZpY2VfcGx1Z2dlZChWaXJ0SU9EZXZpY2UgKnZkZXYsIEVycm9yICoqZXJycCkKPiA+ID4g
PiA+ICAgICAgICAgICAgcmV0dXJuOwo+ID4gPiA+ID4gICAgICAgIH0KPiA+ID4gPiA+IC0gICAg
aWYgKGtsYXNzLT5nZXRfZG1hX2FzICE9IE5VTEwgJiYgaGFzX2lvbW11KSB7Cj4gPiA+ID4gPiAt
ICAgICAgICB2aXJ0aW9fYWRkX2ZlYXR1cmUoJnZkZXYtPmhvc3RfZmVhdHVyZXMsIFZJUlRJT19G
X0lPTU1VX1BMQVRGT1JNKTsKPiA+ID4gPiA+ICsgICAgaWYgKGZhbHNlICYmIGtsYXNzLT5nZXRf
ZG1hX2FzICE9IE5VTEwgJiYKPiA+ID4gPiA+ICsgICAgICAgIHZpcnRpb19ob3N0X2hhc19mZWF0
dXJlKHZkZXYsIFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNKSkgewo+ID4gPiA+ID4gICAgICAgICAg
ICB2ZGV2LT5kbWFfYXMgPSBrbGFzcy0+Z2V0X2RtYV9hcyhxYnVzLT5wYXJlbnQpOwo+ID4gPiA+
ID4gICAgICAgIH0gZWxzZSB7Cj4gPiA+ID4gPiArICAgICAgICB2aXJ0aW9fY2xlYXJfZmVhdHVy
ZSgmdmRldi0+aG9zdF9mZWF0dXJlcywgVklSVElPX0ZfSU9NTVVfUExBVEZPUk0pOwo+ID4gPiA+
ID4gICAgICAgICAgICB2ZGV2LT5kbWFfYXMgPSAmYWRkcmVzc19zcGFjZV9tZW1vcnk7Cj4gPiA+
ID4gPiAgICAgICAgfQo+ID4gPiA+ID4gICAgfQo+ID4gPiA+IFRoaXMgc2VlbXMgdG8gY2xlYXIg
aXQgdW5jb25kaXRpb25hbGx5LiBJIGd1ZXNzIGl0J3MganVzdCBhIGRlYnVnZ2luZwo+ID4gPiA+
IHBhdGNoLCB0aGUgcmVhbCBvbmUgd2lsbCBjb21lIGxhdGVyPwo+ID4gPiAKPiA+ID4gTXkgYmFk
LCBoZXJlJ3MgdGhlIGNvcnJlY3Qgb25lLgo+ID4gPiAKPiA+ID4gVGhhbmtzCj4gPiA+IAo+ID4g
PiAKPiA+ID4gPiA+IC0tIAo+ID4gPiA+ID4gMi4xOS4xCj4gPiA+ID4gPiAKPiA+ID4gPkZyb20g
YjhhOGI1ODJmNDZiYjg2YzdhNzQ1YjI3MmRiN2I3NDQ3NzllNWNjNyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiA+
ID4gRGF0ZTogTW9uLCAyNCBGZWIgMjAyMCAxMjowMDoxMCArMDgwMAo+ID4gPiBTdWJqZWN0OiBb
UEFUQ0hdIHZpcnRpbzogdHVybiBvbiBJT01NVV9QTEFURk9STSBwcm9wZXJseQo+ID4gPiAKPiA+
ID4gV2hlbiB0cmFuc3BvcnQgZG9lcyBub3Qgc3VwcG9ydCBJT01NVSwgd2Ugc2hvdWxkIGNsZWFy
IElPTU1VX1BMQVRGT1JNCj4gPiA+IGV2ZW4gaWYgdGhlIGRldmljZSBhbmQgdmhvc3QgY2xhaW1z
IHRvIHN1cHBvcnQgdGhhdC4gVGhpcyBoZWxwIHRvCj4gPiA+IGF2b2lkIHRoZSBwZXJmb3JtYW5j
ZSBvdmVyaGVhZCBjYXVzZWQgYnkgdW5uZWNlc3NhcnkgSU9UTEIgbWlzcy91cGRhdGUKPiA+ID4g
dHJhbnNhY3Rpb25zIG9uIHN1Y2ggcGxhdGZvcm0uCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4gPiAtLS0KPiA+ID4gICBody92
aXJ0aW8vdmlydGlvLWJ1cy5jIHwgNiArKystLS0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2h3
L3ZpcnRpby92aXJ0aW8tYnVzLmMgYi9ody92aXJ0aW8vdmlydGlvLWJ1cy5jCj4gPiA+IGluZGV4
IGQ2MzMyZDQ1YzMuLjRiZTY0ZTE5M2UgMTAwNjQ0Cj4gPiA+IC0tLSBhL2h3L3ZpcnRpby92aXJ0
aW8tYnVzLmMKPiA+ID4gKysrIGIvaHcvdmlydGlvL3ZpcnRpby1idXMuYwo+ID4gPiBAQCAtNDcs
NyArNDcsNiBAQCB2b2lkIHZpcnRpb19idXNfZGV2aWNlX3BsdWdnZWQoVmlydElPRGV2aWNlICp2
ZGV2LCBFcnJvciAqKmVycnApCj4gPiA+ICAgICAgIFZpcnRpb0J1c1N0YXRlICpidXMgPSBWSVJU
SU9fQlVTKHFidXMpOwo+ID4gPiAgICAgICBWaXJ0aW9CdXNDbGFzcyAqa2xhc3MgPSBWSVJUSU9f
QlVTX0dFVF9DTEFTUyhidXMpOwo+ID4gPiAgICAgICBWaXJ0aW9EZXZpY2VDbGFzcyAqdmRjID0g
VklSVElPX0RFVklDRV9HRVRfQ0xBU1ModmRldik7Cj4gPiA+IC0gICAgYm9vbCBoYXNfaW9tbXUg
PSB2aXJ0aW9faG9zdF9oYXNfZmVhdHVyZSh2ZGV2LCBWSVJUSU9fRl9JT01NVV9QTEFURk9STSk7
Cj4gPiA+ICAgICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOwo+ID4gPiAgICAgICBEUFJJTlRG
KCIlczogcGx1ZyBkZXZpY2UuXG4iLCBxYnVzLT5uYW1lKTsKPiA+ID4gQEAgLTc3LDEwICs3Niwx
MSBAQCB2b2lkIHZpcnRpb19idXNfZGV2aWNlX3BsdWdnZWQoVmlydElPRGV2aWNlICp2ZGV2LCBF
cnJvciAqKmVycnApCj4gPiA+ICAgICAgICAgICByZXR1cm47Cj4gPiA+ICAgICAgIH0KPiA+ID4g
LSAgICBpZiAoa2xhc3MtPmdldF9kbWFfYXMgIT0gTlVMTCAmJiBoYXNfaW9tbXUpIHsKPiA+ID4g
LSAgICAgICAgdmlydGlvX2FkZF9mZWF0dXJlKCZ2ZGV2LT5ob3N0X2ZlYXR1cmVzLCBWSVJUSU9f
Rl9JT01NVV9QTEFURk9STSk7Cj4gPiBTbyBpdCBsb29rcyBsaWtlIHRoaXMgbGluZSBpcyB1bm5l
Y2Vzc2FyeSwgYnV0IGl0J3MgYW4gdW5yZWxhdGVkCj4gPiBjbGVhbnVwLCByaWdodD8KPiAKPiAK
PiBZZXMuCj4gCj4gCj4gPiAKPiA+ID4gKyAgICBpZiAoa2xhc3MtPmdldF9kbWFfYXMgIT0gTlVM
TCAmJgo+ID4gPiArICAgICAgICB2aXJ0aW9faG9zdF9oYXNfZmVhdHVyZSh2ZGV2LCBWSVJUSU9f
Rl9JT01NVV9QTEFURk9STSkpIHsKPiA+ID4gICAgICAgICAgIHZkZXYtPmRtYV9hcyA9IGtsYXNz
LT5nZXRfZG1hX2FzKHFidXMtPnBhcmVudCk7Cj4gPiA+ICAgICAgIH0gZWxzZSB7Cj4gPiA+ICsg
ICAgICAgIHZpcnRpb19jbGVhcl9mZWF0dXJlKCZ2ZGV2LT5ob3N0X2ZlYXR1cmVzLCBWSVJUSU9f
Rl9JT01NVV9QTEFURk9STSk7Cj4gPiAKPiA+IE9mIGNvdXJzZSBhbnkgY2hhbmdlIGxpa2UgdGhh
dCB3aWxsIGhhdmUgdG8gYWZmZWN0IG1pZ3JhdGlvbiBjb21wYXQsIGV0Yy4KPiA+IENhbid0IHdl
IGNsZWFyIHRoZSBiaXQgd2hlbiB3ZSBhcmUgc2VuZGluZyB0aGUgZmVhdHVyZXMgdG8gdmhvc3QK
PiA+IGluc3RlYWQ/Cj4gCj4gCj4gVGhhdCdzIGJldHRlci4KPiAKPiBIb3cgYWJvdXQgYXR0YWNo
ZWQ/Cj4gCj4gVGhhbmtzCj4gCj4gCj4gPiAKPiA+IAo+ID4gPiAgICAgICAgICAgdmRldi0+ZG1h
X2FzID0gJmFkZHJlc3Nfc3BhY2VfbWVtb3J5Owo+ID4gPiAgICAgICB9Cj4gPiA+ICAgfQo+ID4g
PiAtLSAKPiA+ID4gMi4xOS4xCj4gPiA+IAoKPiA+RnJvbSAzMTc3YzUxOTRjNzI5ZjMwNTZiODRj
Njc2NjRjNTliOWI5NDliYjc2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IEZyb206IEphc29u
IFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gRGF0ZTogTW9uLCAyNCBGZWIgMjAyMCAxNzoy
NDoxNCArMDgwMAo+IFN1YmplY3Q6IFtQQVRDSF0gdmhvc3Q6IGRvIG5vdCBzZXQgVklSVElPX0Zf
SU9NTVVfUExBVEZPUk0gd2hlbiBJT01NVSBpcyBub3QKPiAgdXNlZAo+IAo+IFdlIGVuYWJsZSBk
ZXZpY2UgSU9UTEIgdW5jb25kaXRpb25hbGx5IHdoZW4gVklSVElPX0ZfSU9NTVVfUExBVEZPUk0g
aXMKPiBuZWdvdGlhdGVkLiBUaGlzIGxlYWQgdW5uZWNlc3NhcnkgSU9UTEIgbWlzcy91cGRhdGUg
dHJhbnNhY3Rpb25zIHdoZW4KPiBJT01NVSBpcyB1c2VkLiBUaGlzIHBhdGNoIGZpeGVzIHRoaXMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAt
LS0KPiAgaHcvbmV0L3ZpcnRpby1uZXQuYyB8IDMgKysrCj4gIGh3L3ZpcnRpby92aG9zdC5jICAg
fCA0ICstLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2h3L25ldC92aXJ0aW8tbmV0LmMgYi9ody9uZXQvdmlydGlv
LW5ldC5jCj4gaW5kZXggMzYyN2JiMTcxNy4uMGQ1MGU4YmQzNCAxMDA2NDQKPiAtLS0gYS9ody9u
ZXQvdmlydGlvLW5ldC5jCj4gKysrIGIvaHcvbmV0L3ZpcnRpby1uZXQuYwo+IEBAIC04NzksNiAr
ODc5LDkgQEAgc3RhdGljIHZvaWQgdmlydGlvX25ldF9zZXRfZmVhdHVyZXMoVmlydElPRGV2aWNl
ICp2ZGV2LCB1aW50NjRfdCBmZWF0dXJlcykKPiAgICAgICAgICB2aXJ0aW9fbmV0X2FwcGx5X2d1
ZXN0X29mZmxvYWRzKG4pOwo+ICAgICAgfQo+ICAKPiArICAgIGlmICh2ZGV2LT5kbWFfYXMgPT0g
JmFkZHJlc3Nfc3BhY2VfbWVtb3J5KQo+ICsgICAgICAgIGZlYXR1cmVzICY9IH4oMVVMTCA8PCBW
SVJUSU9fRl9JT01NVV9QTEFURk9STSk7Cj4gKwo+ICAgICAgZm9yIChpID0gMDsgIGkgPCBuLT5t
YXhfcXVldWVzOyBpKyspIHsKPiAgICAgICAgICBOZXRDbGllbnRTdGF0ZSAqbmMgPSBxZW11X2dl
dF9zdWJxdWV1ZShuLT5uaWMsIGkpOwoKVGhpcyBwb2tlcyBhdCBhY2tlZCBmZWF0dXJlcy4gSSB0
aGluayB0aGV5IGFyZSBhbHNvCmd1ZXN0IHZpc2libGUgLi4uCgo+IGRpZmYgLS1naXQgYS9ody92
aXJ0aW8vdmhvc3QuYyBiL2h3L3ZpcnRpby92aG9zdC5jCj4gaW5kZXggOWVkZmFkYzgxZC4uNzEx
YjExMzZmNiAxMDA2NDQKPiAtLS0gYS9ody92aXJ0aW8vdmhvc3QuYwo+ICsrKyBiL2h3L3ZpcnRp
by92aG9zdC5jCj4gQEAgLTI4OCw5ICsyODgsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdmhvc3Rf
ZGV2X2xvZ19yZXNpemUoc3RydWN0IHZob3N0X2RldiAqZGV2LCB1aW50NjRfdCBzaXplKQo+ICAK
PiAgc3RhdGljIGludCB2aG9zdF9kZXZfaGFzX2lvbW11KHN0cnVjdCB2aG9zdF9kZXYgKmRldikK
PiAgewo+IC0gICAgVmlydElPRGV2aWNlICp2ZGV2ID0gZGV2LT52ZGV2Owo+IC0KPiAtICAgIHJl
dHVybiB2aXJ0aW9faG9zdF9oYXNfZmVhdHVyZSh2ZGV2LCBWSVJUSU9fRl9JT01NVV9QTEFURk9S
TSk7Cj4gKyAgICByZXR1cm4gdmlydGlvX2hhc19mZWF0dXJlKGRldi0+YWNrZWRfZmVhdHVyZXMs
IFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNKTsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgKnZob3N0
X21lbW9yeV9tYXAoc3RydWN0IHZob3N0X2RldiAqZGV2LCBod2FkZHIgYWRkciwKPiAtLSAKPiAy
LjE5LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
