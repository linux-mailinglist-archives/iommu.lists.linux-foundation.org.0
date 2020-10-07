Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 78768285DF9
	for <lists.iommu@lfdr.de>; Wed,  7 Oct 2020 13:15:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 29A8B227A3;
	Wed,  7 Oct 2020 11:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfDdfZfUUzfo; Wed,  7 Oct 2020 11:15:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6FE1422654;
	Wed,  7 Oct 2020 11:15:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CD57C0051;
	Wed,  7 Oct 2020 11:15:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4431C0051
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 11:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B31F786A81
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 11:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MzqkGAM-W1t0 for <iommu@lists.linux-foundation.org>;
 Wed,  7 Oct 2020 11:15:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CCE2986A7C
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602069345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3r5XQBzMLmQ+lHSJjnDEGaGsxnKJm0CF1PWaPtea4dc=;
 b=GG8zvhq9C5PJbw0JeYKdjzed/70oj5HWbjeBFYvekhyut1Xdfd/UAQnPafg60MQsXvjyGA
 NAqOJK3IY9wy4AxtgrUWND1G1+/RyASo193fwy7GEpbr5Wksx+BAljtEgI3+cd3k8Exf9P
 wBaVBlQxCIYENgY81QEm43kfDsIRpPU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-fOpH3yjRNs6UHquur47iAg-1; Wed, 07 Oct 2020 07:15:44 -0400
X-MC-Unique: fOpH3yjRNs6UHquur47iAg-1
Received: by mail-wr1-f72.google.com with SMTP id 33so819178wrk.12
 for <iommu@lists.linux-foundation.org>; Wed, 07 Oct 2020 04:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3r5XQBzMLmQ+lHSJjnDEGaGsxnKJm0CF1PWaPtea4dc=;
 b=jxid36tzYMIcE6199iMR3oVyFb3/cftL4miVtuN71/IDJRi7C7VrUXZweH9MTzvQ4i
 W7ewZ1WDP2qTFWIeHkS99lVT0vDw91RJ0eDq/ivK6Ta2kdLUkUQH/xlrGHMXyJBHOr/W
 ExETEh2reLSQMXhMYSQQw+wxBx7ZZavtVh5EqzLFVsEk/E1vNTgeuMmgPkasWsFGC1qA
 785vxfQsEE9CuwLcQlQHOBoMqXv5cMu3fYaibKiKrS2E1AuY1WZrY8otQI8pQAVz3fgm
 zHKxkyfyskhy21nCYIhVUgIKZFnfroSZpFPrkqFV60x0vL2jHcldrY7Z83wEsj8LgdzJ
 +FvQ==
X-Gm-Message-State: AOAM532ypCWQMEUDo86yZqeWME8wfUiVgE8mVHuRcDW1QdHApiRZTjJv
 kMyUiKuf4ayLERocTDW9dSZct4uP554ix5uwrLvN40Q8DZ4p5aIHp2iSJ6/zL2h4UN3ESkOcefX
 s0EstX6vgbJvIc0t5qrbsR7mcKS6GxQ==
X-Received: by 2002:a5d:46c5:: with SMTP id g5mr3072278wrs.416.1602069342760; 
 Wed, 07 Oct 2020 04:15:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7sYpP9gVtxipT0pzhdsv4463xKXEPVIHdH2X3m2sQwU7XAAsdRDas6Bf2F6nO3skuNDVcig==
X-Received: by 2002:a5d:46c5:: with SMTP id g5mr3072258wrs.416.1602069342576; 
 Wed, 07 Oct 2020 04:15:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d2f4:5943:190c:39ff?
 ([2001:b07:6468:f312:d2f4:5943:190c:39ff])
 by smtp.gmail.com with ESMTPSA id a15sm2556682wrn.3.2020.10.07.04.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 04:15:41 -0700 (PDT)
Subject: Re: [PATCH 13/13] x86/kvm: Add KVM_FEATURE_MSI_EXT_DEST_ID
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
References: <77e64f977f559412f62b467fd062d051ea288f14.camel@infradead.org>
 <20201005152856.974112-1-dwmw2@infradead.org>
 <20201005152856.974112-13-dwmw2@infradead.org>
 <472a34e3-2981-0c7b-1fb0-da8debbdc728@redhat.com>
 <b1f7e1210580acdf4673498be71eaf33acb8c146.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8a502c78-71d7-83f6-7ba8-b16fd41e64fe@redhat.com>
Date: Wed, 7 Oct 2020 13:15:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b1f7e1210580acdf4673498be71eaf33acb8c146.camel@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: iommu <iommu@lists.linux-foundation.org>, linux-hyperv@vger.kernel.org,
 kvm <kvm@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 07/10/20 10:59, David Woodhouse wrote:
> Yeah, I was expecting the per-irqdomain affinity support to take a few
> iterations. But this part, still sticking with the current behaviour of
> only allowing CPUs to come online at all if they can be reached by all
> interrupts, can probably go in first.
> 
> It's presumably (hopefully!) a blocker for the qemu patch which exposes
> the same feature bit defined in this patch.

Yeah, though we could split it further and get the documentation part in
first.  That would let the QEMU part go through.

Paolo

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
