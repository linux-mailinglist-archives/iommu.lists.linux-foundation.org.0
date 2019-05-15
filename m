Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A61F659
	for <lists.iommu@lfdr.de>; Wed, 15 May 2019 16:16:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8768AC7C;
	Wed, 15 May 2019 14:16:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6390DB49
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 14:16:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B00DA82C
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 14:16:39 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id j187so4821904wma.1
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=YCjCBo6v6g6WrU5/XkOQpdgYbmJIm6MrTmOgU9Ei21U=;
	b=UsXKrMtUMNcLrIeZ0277LKCagFDPkzvmZZJAF5aJVQjzqIAG6q5e1x7A2aCPtKCRcO
	Ta7bQ59MIcTlOUZiZZNwNFM4WJBMOrubZGHoBrVYfO18gYI8JbnUfrWo5B8GVMv8sKzz
	8azdKZ6yBk8Oyc5juoqrR97PRHBS2Lpgdlq8qgdvQ1pNHj+04NKFQ3MlpJLDfZ0gXOcI
	Vx+QA8p1gHfluz44k6lHxmZ0p2mIMAsrkWvw6lJCCVYtWE6/a15r6ZPSJRreXR2n43eP
	HE9W+bMVg6Kyk3qY3lG7jmafSsIbG4AabWQnslxZ/pBqJA/MCgXTbG0wOXja5LXoEjPf
	K5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=YCjCBo6v6g6WrU5/XkOQpdgYbmJIm6MrTmOgU9Ei21U=;
	b=mHa5xm79dV6W1AUiJX427+YSoQoiDiuL3vvRVc1G1bLt14EWNlCA4agYKizI+bNx0E
	qrB4+ju0JDhjDFNIbMT2ZrKT7wydIowp35LeIvspgU6tWw2kCadXTvHiWZ3OBbeX0Wmz
	EIsH1z8fNgqIAdr8Nto0ZlWN/HOvK0Wjo3A9bryaaVa88/hzBUoH1uHMmp4W5TwkskBP
	kMhv+2fseWxaqFs/mlyy91SSNmTHcghISZlwJKCa9s82AetfEuY7rPHUuZn229fIbo2i
	RAvyIqu0DbVQw8CZDzEGEkGFcBGegGmiVTJ0vtLqk/kaoSbaZU10P/x+bhZytif6DJ+c
	OMJg==
X-Gm-Message-State: APjAAAU4qcU6KXwj3pHodMdCaFYmQEoCtb3iP/OYSmwy0uw9nrYwgKSp
	B2RfrjvHELDaXJxd0T2AnbU=
X-Google-Smtp-Source: APXvYqx664FRwC7DA3gsl87Hho1roeqvxvdUgq3sHf5EOeDzje9dsy1M4t65L4Q//GQTNhM9D7XayA==
X-Received: by 2002:a05:600c:1050:: with SMTP id
	16mr23229515wmx.149.1557929798431; 
	Wed, 15 May 2019 07:16:38 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
	by smtp.googlemail.com with ESMTPSA id
	q16sm2480233wmj.17.2019.05.15.07.16.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 May 2019 07:16:37 -0700 (PDT)
From: "StarostaCZ@gmail.com" <starostacz@gmail.com>
X-Google-Original-From: "StarostaCZ@gmail.com" <StarostaCZ@gmail.com>
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on AMD
	boards.
To: Oliver Neukum <oneukum@suse.com>, Joerg Roedel <joro@8bytes.org>,
	Johan Hovold <johan@kernel.org>
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
	<20190429094847.GI26546@localhost> <20190503153716.GE11605@8bytes.org>
	<8748125e-f360-ff0e-ea15-699bce9e7747@gmail.com>
	<4e7f0267-eba8-81c3-4036-25924ea9df98@gmail.com>
	<1557911856.2950.10.camel@suse.com>
	<3e7ec2f2-ac47-a031-96ba-fa2b9f21ed2e@gmail.com>
	<1557913582.2950.15.camel@suse.com>
	<c57ccafd-7ad4-63e4-54c1-e1fb136ebeed@gmail.com>
	<1557928483.2950.18.camel@suse.com>
Message-ID: <4a48a017-fbcb-619f-f2d5-4d627a673021@gmail.com>
Date: Wed, 15 May 2019 16:15:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557928483.2950.18.camel@suse.com>
Content-Language: cs
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Dne 15.5.2019 v 15:54 Oliver Neukum napsal(a):
> 1. Determine whether the bug depends on the use of an IOMMU
No, bug not depends on the use of an IOMMU. System crash on both cases.

> 2.Send a new report to the corresponding mailing list
Which mailing list is correct?

starosta
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
