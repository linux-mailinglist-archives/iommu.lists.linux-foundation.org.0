Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B23120F
	for <lists.iommu@lfdr.de>; Fri, 31 May 2019 18:16:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0E503171A;
	Fri, 31 May 2019 16:16:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BC2891692
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 16:15:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4B7D88B5
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 16:15:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 6E218AE8D;
	Fri, 31 May 2019 16:15:24 +0000 (UTC)
Subject: Re: [PATCH v3 0/6] Prerequisites for NXP LS104xA SMMU enablement
To: laurentiu.tudor@nxp.com
References: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Openpgp: preference=signencrypt
Organization: SUSE Linux GmbH
Message-ID: <d086216f-f3fc-c88a-3891-81e84e8bdb01@suse.de>
Date: Fri, 31 May 2019 18:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: madalin.bucur@nxp.com, netdev@vger.kernel.org, roy.pledge@nxp.com,
	linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
	Joakim.Tjernlund@infinera.com, iommu@lists.linux-foundation.org,
	camelia.groza@nxp.com, Mian Yousaf Kaukab <yousaf.kaukab@suse.com>,
	linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
	linux-arm-kernel@lists.infradead.org
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

SGkgTGF1cmVudGl1LAoKQW0gMzAuMDUuMTkgdW0gMTY6MTkgc2NocmllYiBsYXVyZW50aXUudHVk
b3JAbnhwLmNvbToKPiBUaGlzIHBhdGNoIHNlcmllcyBjb250YWlucyBzZXZlcmFsIGZpeGVzIGlu
IHByZXBhcmF0aW9uIGZvciBTTU1VCj4gc3VwcG9ydCBvbiBOWFAgTFMxMDQzQSBhbmQgTFMxMDQ2
QSBjaGlwcy4gT25jZSB0aGVzZSBnZXQgcGlja2VkIHVwLAo+IEknbGwgc3VibWl0IHRoZSBhY3R1
YWwgU01NVSBlbmFibGVtZW50IHBhdGNoZXMgY29uc2lzdGluZyBpbiB0aGUKPiByZXF1aXJlZCBk
ZXZpY2UgdHJlZSBjaGFuZ2VzLgoKSGF2ZSB5b3UgdGhvdWdodCB0aHJvdWdoIHdoYXQgd2lsbCBo
YXBwZW4gaWYgdGhpcyBwYXRjaCBvcmRlcmluZyBpcyBub3QKcHJlc2VydmVkPyBJbiBwYXJ0aWN1
bGFyLCBhIHVzZXIgaW5zdGFsbGluZyBhIGZ1dHVyZSBVLUJvb3QgdXBkYXRlIHdpdGgKdGhlIERU
QiBiaXRzIGJ1dCBib290aW5nIGEgc3RhYmxlIGtlcm5lbCB3aXRob3V0IHRoaXMgcGF0Y2ggc2Vy
aWVzIC0Kd291bGRuJ3QgdGhhdCByZWdyZXNzIGRwYWEgdGhlbiBmb3Igb3VyIGN1c3RvbWVycz8K
ClJlZ2FyZHMsCkFuZHJlYXMKCi0tIApTVVNFIExpbnV4IEdtYkgsIE1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQpHRjogRmVsaXggSW1lbmTDtnJmZmVyLCBNYXJ5IEhpZ2dp
bnMsIFNyaSBSYXNpYWgKSFJCIDIxMjg0IChBRyBOw7xybmJlcmcpCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
