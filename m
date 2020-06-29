Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCE720CF94
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 17:19:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 432C7893E3;
	Mon, 29 Jun 2020 15:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7tvrfSXMC8H; Mon, 29 Jun 2020 15:18:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8623D893DF;
	Mon, 29 Jun 2020 15:18:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DDE6C016E;
	Mon, 29 Jun 2020 15:18:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1855C016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 15:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ED80F893E1
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 15:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOfuDFM2Ubhu for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 15:18:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9D40C893DF
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 15:18:56 +0000 (UTC)
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1jpvYN-0003Oq-V0; Mon, 29 Jun 2020 17:18:39 +0200
Received: from [178.196.57.75] (helo=pc-9.home)
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1jpvYN-000POt-Hi; Mon, 29 Jun 2020 17:18:39 +0200
Subject: Re: [PATCH net] xsk: remove cheap_dma optimization
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 Christoph Hellwig <hch@lst.de>
References: <20200626134358.90122-1-bjorn.topel@gmail.com>
 <c60dfb5a-2bf3-20bd-74b3-6b5e215f73f8@iogearbox.net>
 <20200627070406.GB11854@lst.de>
 <88d27e1b-dbda-301c-64ba-2391092e3236@intel.com>
 <e879bcc8-5f7d-b1b3-9b66-1032dec6245d@iogearbox.net>
 <81aec200-c1a0-6d57-e3b6-26dad30790b8@intel.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <903c646c-dc74-a15c-eb33-e1b67bc7da0d@iogearbox.net>
Date: Mon, 29 Jun 2020 17:18:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <81aec200-c1a0-6d57-e3b6-26dad30790b8@intel.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.102.3/25858/Mon Jun 29 15:30:49 2020)
Cc: maximmi@mellanox.com, konrad.wilk@oracle.com, jonathan.lemon@gmail.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, davem@davemloft.net,
 magnus.karlsson@intel.com
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

T24gNi8yOS8yMCA1OjEwIFBNLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IE9uIDIwMjAtMDYtMjkg
MTU6NTIsIERhbmllbCBCb3JrbWFubiB3cm90ZToKPj4KPj4gT2ssIGZhaXIgZW5vdWdoLCBwbGVh
c2Ugd29yayB3aXRoIERNQSBmb2xrcyB0byBnZXQgdGhpcyBwcm9wZXJseSBpbnRlZ3JhdGVkIGFu
ZAo+PiByZXN0b3JlZCB0aGVuLiBBcHBsaWVkLCB0aGFua3MhCj4gCj4gRGFuaWVsLCB5b3Ugd2Vy
ZSB0b28gcXVpY2shIFBsZWFzZSByZXZlcnQgdGhpcyBvbmU7IENocmlzdG9waCBqdXN0IHN1Ym1p
dHRlZCBhIDQtcGF0Y2gtc2VyaWVzIHRoYXQgYWRkcmVzc2VzIGJvdGggdGhlIERNQSBBUEksIGFu
ZCB0aGUgcGVyZiByZWdyZXNzaW9uIQoKTmljZSwgdG9zc2VkIGZyb20gYnBmIHRyZWUgdGhlbiEg
KExvb2tzIGxpa2UgaXQgZGlkbid0IGxhbmQgb24gdGhlIGJwZiBsaXN0IHlldCwKYnV0IHNlZW1z
IG90aGVyIG1haWxzIGFyZSBjdXJyZW50bHkgc3R1Y2sgYXMgd2VsbCBvbiB2Z2VyLiBJIHByZXN1
bWUgaXQgd2lsbCBiZQpyb3V0ZWQgdG8gTGludXMgdmlhIENocmlzdG9waD8pCgpUaGFua3MsCkRh
bmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21t
dSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
